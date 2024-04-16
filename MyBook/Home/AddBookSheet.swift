//
//  AddBookSheet.swift
//  MyBook
//
//  Created by win win on 13/04/24.
//

import SwiftUI

struct AddBookSheet: View {
    // access container
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title:String = ""
    @State private var author:String = ""
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Basic information")) {
                    LabeledContent {
                        TextField("Book title", text: $title)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("Title")
                            Spacer()
                        }
                    }
                    LabeledContent {
                        TextField("Author name", text: $author)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("Author")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newBook = Book(title: title, author: author)
                        context.insert(newBook)
                        dismiss()
                    } label: {
                        Text("Submit")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)
                    .disabled(title.isEmpty || author.isEmpty)
                }
            }
        }
    }
}


#Preview {
    AddBookSheet()
}
