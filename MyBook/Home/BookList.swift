//
//  BookList.swift
//  MyBook
//
//  Created by win win on 16/04/24.
//

import SwiftUI
import SwiftData

struct BookList: View {
    // access container
    @Environment(\.modelContext) var context
    // fetch book data
    @Query(sort: \Book.dateAdded) var books: [Book] = []
    
    init(sortOrder: SortOrder){
        let sortDescriptors: [SortDescriptor<Book>] = switch sortOrder {
        case .title:
            [SortDescriptor(\Book.title), SortDescriptor(\Book.title)]
        case .dateAdded:
            [SortDescriptor(\Book.dateAdded)]
        case .rating:
            [SortDescriptor(\Book.rating)]
        }
        _books = Query(sort:sortDescriptors)
    }
    
    @State private var bookToEdit: Book?
    
    @State private var isShowingAddSheet = false
    var body: some View {
        List {
            ForEach(books) {book in
                BookItem(bookdata: book)
                    .onTapGesture {
                        bookToEdit = book
                    }
            }
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    context.delete(books[index])
                }
            })
        }
        .overlay {
            if books.isEmpty {
                ContentUnavailableView(label: {
                    Label("No books", systemImage: "books.vertical")
                }, description: {
                    Text("Add a new book by click on a button below")
                }, actions: {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("add new book")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                })
            }
        }
        .sheet(item: $bookToEdit) {book in
            EditBookSheet(bookdata: book)
        }
        .sheet(isPresented: $isShowingAddSheet) {
            AddBookSheet()
        }
        .toolbar {
            Button {
                isShowingAddSheet = true
            } label: {
                Image(systemName: "plus")
                    .imageScale(.large)
            }
        }
    }
}
