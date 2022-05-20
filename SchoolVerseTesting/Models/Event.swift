//
//  Event.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import Foundation

struct Event: Codable, Identifiable {
    var id: String // custom id, not Firebase generated @DocumentID
    var name: String
    var description: String
    var location: String?
    var start: Date
    var end: Date
}

// change model later
struct SportsEvent: Codable, Identifiable {
    var id: String // custom id, not Firebase generated @DocumentID
    var description: String
    var location: String?
    var start: Date
    var end: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case location
        case start = "start_date"
        case end = "end_date"
    }
}
