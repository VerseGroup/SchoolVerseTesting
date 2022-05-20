//
//  TabBarItem.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import SwiftUI

enum TabBarItem: Hashable {
    case home, tasks, schedule, more
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .tasks: return "list.bullet.rectangle.portrait"
        case .schedule: return "calendar"
        case .more: return "line.3.horizontal"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .tasks: return "Tasks"
        case .schedule: return "Schedule"
        case .more: return "More"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.purple
        case .tasks: return Color.purple
        case .schedule: return Color.purple
        case .more: return Color.purple
        }
    }
}
