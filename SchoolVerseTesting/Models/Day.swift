//
//  Day.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/15/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// TODO: implement error handling for Day.failed

// make sure to edit for next year's schedule
struct DayEvent: Codable, Identifiable {
    var id: String // custom id, not Firebase generated @DocumentID
    var date: Date
    var day: Day
}

enum Day: String, Codable, Comparable {
    case dayOne
    case dayTwo
    case dayThree
    case dayFour
    case dayFive
    case daySix
    case daySeven
    // case dayEight // next year
    
    case failed
}

// sorting functionality
// source: https://stackoverflow.com/questions/46864278/how-to-sort-objects-by-its-enum-value
extension Day {
    private var sortOrder: Int {
        switch self {
        case .dayOne:
            return 1
        case .dayTwo:
            return 2
        case .dayThree:
            return 3
        case .dayFour:
            return 4
        case .dayFive:
            return 5
        case .daySix:
            return 6
        case .daySeven:
            return 7
        case .failed:
            return -1
        }
    }
    
    static func ==(lhs: Day, rhs: Day) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }
    
    static func <(lhs: Day, rhs: Day) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }
}

// codable functionality
// source: https://levelup.gitconnected.com/firestore-to-swift-models-with-complex-types-enums-and-arrays-282893affb15
extension Day {
    var description: String {
        get {
            switch self {
            case .dayOne:
                return "Day 1"
            case .dayTwo:
                return "Day 2"
            case .dayThree:
                return "Day 3"
            case .dayFour:
                return "Day 4"
            case .dayFive:
                return "Day 5"
            case .daySix:
                return "Day 6"
            case .daySeven:
                return "Day 7"
            case .failed:
                return "Failed"
            }
        }
    }
    
    static func getDay(day: String) -> Day {
        switch day {
        case "Day 1":
            return .dayOne
        case "Day 2":
            return .dayTwo
        case "Day 3":
            return .dayThree
        case "Day 4":
            return .dayFour
        case "Day 5":
            return .dayFive
        case "Day 6":
            return .daySix
        case "Day 7":
            return .daySeven
        default:
            return .failed
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = Day.getDay(day: rawValue)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
}
