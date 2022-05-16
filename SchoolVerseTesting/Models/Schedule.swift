//
//  Schedule.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/14/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Schedule: Codable, Identifiable {
    @DocumentID var id: String?
    var days: [DaySchedule] {
        didSet {
            days.sort()
        }
    }
    
    var userId: String?
    
    enum CodingKeys: String, CodingKey {
        case days
        case userId = "user_id"
    }
}

struct DaySchedule: Codable, Comparable {
    var day: Day
    var periods: [PeriodInfo] {
        didSet {
            periods.sort()
        }
    }
    
    static func ==(lhs: DaySchedule, rhs: DaySchedule) -> Bool {
        return lhs.day == rhs.day
    }
    
    static func <(lhs: DaySchedule, rhs: DaySchedule) -> Bool {
        return lhs.day < rhs.day
    }
}

// to ensure ForEach loop works
struct UniquePeriodInfo: Identifiable {
    var id = UUID()
    var period: PeriodInfo
}

struct PeriodInfo: Codable, Comparable {
    var period: Period
    var className: String
    var startTime: String
    var information: String
    
    enum CodingKeys: String, CodingKey {
        case period
        case className = "class_name"
        case startTime = "start_time"
        case information
    }
}

// comparable functionality
extension PeriodInfo {
    static func ==(lhs: PeriodInfo, rhs: PeriodInfo) -> Bool {
        return lhs.period == rhs.period
    }
    
    static func <(lhs: PeriodInfo, rhs: PeriodInfo) -> Bool {
        return lhs.period < rhs.period
    }
}

enum Period: String, Codable, Comparable {
    case homeroom
    case periodOne
    case periodTwo
    case periodThree
    case periodFour
    case periodFiveA // first lunch
    case periodFiveB // second lunch
    case periodSix
    case periodSeven
    
    case failed
}

// sorting functionality
// source: https://stackoverflow.com/questions/46864278/how-to-sort-objects-by-its-enum-value
extension Period {
    private var sortOrder: Int {
        switch self {
        case .homeroom:
            return 0
        case .periodOne:
            return 1
        case .periodTwo:
            return 2
        case .periodThree:
            return 3
        case .periodFour:
            return 4
        case .periodFiveA:
            return 5
        case .periodFiveB:
            return 6
        case .periodSix:
            return 7
        case .periodSeven:
            return 8
        case .failed:
            return -1
        }
    }
    
    static func ==(lhs: Period, rhs: Period) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }
    
    static func <(lhs: Period, rhs: Period) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }
}


// codable functionality
// source: https://levelup.gitconnected.com/firestore-to-swift-models-with-complex-types-enums-and-arrays-282893affb15
extension Period {
    var description: String {
        get {
            switch self {
            case .homeroom:
                return "Homeroom"
            case .periodOne:
                return "Period 1"
            case .periodTwo:
                return "Period 2"
            case .periodThree:
                return "Period 3"
            case .periodFour:
                return "Period 4"
            case .periodFiveA:
                return "Period 5a"
            case .periodFiveB:
                return "Period 5b"
            case .periodSix:
                return "Period 6"
            case .periodSeven:
                return "Period 7"
            case .failed:
                return "Failed"
            }
        }
    }
    
    static func getPeriod(period: String) -> Period {
        switch period {
        case "Homeroom":
            return .homeroom
        case "Period 1":
            return .periodOne
        case "Period 2":
            return .periodTwo
        case "Period 3":
            return .periodThree
        case "Period 4":
            return .periodFour
        case "Period 5a":
            return .periodFiveA
        case "Period 5b":
            return .periodFiveB
        case "Period 6":
            return .periodSix
        case "Period 7":
            return .periodSeven
        default:
            return .failed
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = Period.getPeriod(period: rawValue)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
}
