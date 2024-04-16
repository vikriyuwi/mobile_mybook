//
//  EditBookSheet.swift
//  MyBook
//
//  Created by win win on 13/04/24.
//

import SwiftUI

struct EditBookSheet: View {
    // access container
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var bookdata:Book
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Basic information")) {
                    LabeledContent {
                        TextField("Book title", text: $bookdata.title)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("Title")
                            Spacer()
                        }
                    }
                    LabeledContent {
                        TextField("Author name", text: $bookdata.author)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("Author")
                            Spacer()
                        }
                    }
                }
                Section(header: Text("Rating")) {
                    HStack {
                        ForEach(0..<bookdata.rating, id: \.self) {rating in
                            Image(systemName: "star.fill")
                                .imageScale(.large)
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    bookdata.rating = rating + 1
                                }
                        }
                        ForEach(0..<(5-bookdata.rating), id: \.self) {rating in
                            Image(systemName: "star")
                                .imageScale(.large)
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    bookdata.rating = bookdata.rating + rating + 1
                                }
                        }
                        Spacer()
                        Text(String(bookdata.rating))
                    }
                }
                Section(header: Text("Timeline")) {
                    DatePicker(selection: $bookdata.dateAdded, displayedComponents: .date, label: {
                        Text("Date added")
                    })
                    DatePicker(selection: $bookdata.dateStarted, displayedComponents: .date, label: {
                        Text("Date started")
                    })
                    DatePicker(selection: $bookdata.dateCompleted, displayedComponents: .date, label: {
                        Text("Date completed")
                    })
                }
                Section(header: Text("Summary")) {
                    TextField("Summary", text: $bookdata.summary, axis: .vertical)
                        .multilineTextAlignment(.leading)
                        .lineLimit(5...5)
                }
            }
            .navigationTitle("Edit book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Text("Cancel")
//                    }
//                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)
//                    .disabled(title.isEmpty || author.isEmpty)
                }
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var bookdata:Book = Book(title: "Apa ya", author: "Fikri", rating: 4)
        
        var body: some View {
            EditBookSheet(bookdata: bookdata)
        }
    }
    return PreviewWrapper()
}
