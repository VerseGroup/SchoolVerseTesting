//
//  Date.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import Foundation

extension Date {
    private var weekDateTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, h:mm a"
        return formatter
    }
    
    func weekDateTimeString() -> String {
        return weekDateTimeFormatter.string(from: self)
    }
    
    private var weekDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter
    }
    
    func weekDateString() -> String {
        return weekDateFormatter.string(from: self)
    }
}
