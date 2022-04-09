//
//  Date.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import Foundation

extension Date {
    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, h:mm a"
        return formatter
    }
    
    func asFormattedDateString() -> String {
        return formatter.string(from: self)
    }
}
