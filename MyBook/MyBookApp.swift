//
//  MyBookApp.swift
//  MyBook
//
//  Created by win win on 12/04/24.
//

import SwiftUI
import SwiftData

@main
struct MyBookApp: App {
    let myBook: ModelContainer = {
        let schema = Schema([Book.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(myBook)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
