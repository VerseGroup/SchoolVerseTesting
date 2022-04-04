//
//  Task.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// TODO: Add colors, group courses together (probably make course a struct

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var completed: Bool
    var dueDate: Date
    var description: String
    
    var courseId: String
    var courseName: String
    
    var userId: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case completed
        case dueDate = "due_date"
        case description
        
        case courseId = "course_id"
        case courseName = "course_name"
        
        case userId = "user_id"
    }
}
