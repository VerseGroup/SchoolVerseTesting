//
//  SportsRepository.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class SportsRepository: ObservableObject {
    private let path: String = "SPORTS"
    private let db = Firestore.firestore()
    
    @Published var sports: [SportsEvent] = []
    @Published var errorMessage: String?
    
    init() {
        loadSports()
    }
    
    func loadSports() {
        db.collection(path)
            .addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    self?.errorMessage = "No sports events yet"
                    return
                }
                self?.sports = documents.compactMap({ queryDocumentSnapshot in
                    let result = Result { try queryDocumentSnapshot.data(as: SportsEvent.self) }
                    
                    switch result {
                    case .success(let sportsEvent):
                        self?.errorMessage = nil
                        return sportsEvent
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
