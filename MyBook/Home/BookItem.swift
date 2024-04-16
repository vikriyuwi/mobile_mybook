//
//  BookItem.swift
//  MyBook
//
//  Created by win win on 13/04/24.
//

import SwiftUI

struct BookItem: View {
    
    let bookdata: Book
    var body: some View {
        VStack {
            HStack {
                Text(bookdata.title)
                Spacer()
                Text(bookdata.dateAdded, format: .dateTime.month(.abbreviated).day())
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            HStack {
                Text("by " + bookdata.author)
                    .font(.caption.bold())
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            HStack {
                ForEach(0..<bookdata.rating, id: \.self) {_ in
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                        .foregroundColor(.yellow)
                }
                ForEach(0..<(5-bookdata.rating), id: \.self) {_ in
                    Image(systemName: "star")
                        .imageScale(.small)
                        .foregroundColor(.yellow)
                }
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var book:Book = Book(title: "Judul buku", author: "siapa", rating: 3)
        var body: some View {
            BookItem(bookdata: book)
        }
    }
    return PreviewWrapper()
}
