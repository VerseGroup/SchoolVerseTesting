//
//  ScheduleRepository.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/14/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class ScheduleRepository: ObservableObject {
    private let path: String = "DAYS"
    private let db = Firestore.firestore()
    
    @Published var days: [DayEvent] = []
    @Published var currentDate: Date?
    @Published var currentDay: Day?
    @Published var errorMessage: String?
    
    init() {
        loadDays()
    }
    
    func loadDays() {
        db.collection(path)
            .addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    self?.errorMessage = "No days found"
                    return
                }
                self?.days = documents.compactMap({ queryDocumentSnapshot in
                    print(queryDocumentSnapshot.debugDescription)
                    let result = Result { try queryDocumentSnapshot.data(as: DayEvent.self) }
                    
                    switch result {
                    case .success(let day):
                        self?.errorMessage = nil
                        return day
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
