//
//  EventRepository.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class EventRepository: ObservableObject {
    private let path: String = "EVENTS"
    private let db = Firestore.firestore()
    
    @Published var events: [Event] = []
    @Published var errorMessage: String?

    init() {
        loadEvents()
    }
    
    func loadEvents() {
        db.collection(path)
            .addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    self?.errorMessage = "No events yet"
                    return
                }
                self?.events = documents.compactMap({ queryDocumentSnapshot in
                    let result = Result { try queryDocumentSnapshot.data(as: Event.self) }
                    
                    switch result {
                    case .success(let event):
                        self?.errorMessage = nil
                        return event
                    case .failure(let error):
                        switch error {
                        case DecodingError.typeMismatch(_, let context):
                            self?.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                        case DecodingError.valueNotFound(_, let context):
                            self?.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                        case DecodingError.keyNotFound(_, let context):
                            self?.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                        case DecodingError.dataCorrupted(let key):
                            self?.errorMessage = "\(error.localizedDescription): \(key)"
                        default:
                            self?.errorMessage = "Error decoding document: \(error.localizedDescription)"
                        }
                        return nil
                    }
                })
            }
    }
}
