//
//  BookModel.swift
//  MyBook
//
//  Created by win win on 12/04/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title:String
    var author:String
    var dateAdded:Date
    var dateStarted:Date
    var dateCompleted:Date
    var summary:String
    var rating:Int
    var status:Status
    
    init(
        title: String,
        author: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        summary: String = "",
        rating: Int = 0,
        status: Status = .onShelf
    ) {
        self.title = title
        self.author = author
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.summary = summary
        self.rating = rating
        self.status = status
    }
}

enum Status: Int, Codable, Identifiable, CaseIterable {
    case onShelf, inProgress, complete
    var id: Self {
        self
    }
    var desc: String {
        switch self {
        case .onShelf:
            "On shelf"
        case .inProgress:
            "In progress"
        case .complete:
            "Complete"
        }
    }
}
