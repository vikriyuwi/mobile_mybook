//
//  ContentView.swift
//  MyBook
//
//  Created by win win on 12/04/24.
//

import SwiftUI
import SwiftData

enum SortOrder: String, Identifiable, CaseIterable {
    case title, dateAdded, rating
    
    var id: Self {
        self
    }
}

struct ContentView: View {
    @State private var sortOrder = SortOrder.title
    var body: some View {
        NavigationStack {
            HStack {
                Picker("", selection: $sortOrder) {
                    ForEach(SortOrder.allCases) { sortItem in
                        Text("Sort by \(sortItem.rawValue)").tag(sortItem)
                    }
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding(16)
            BookList(sortOrder: sortOrder)
            .navigationTitle("Book shelf")
        }
    }
}

#Preview {
    ContentView()
}
