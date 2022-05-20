//
//  UserRepository.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

// TODO: ADD USER REPOSITORY AND OTHER USER FUNCTIONS
class UserRepository: ObservableObject {
    private let path: String = "EVENTS"
    private let db = Firestore.firestore()
}
