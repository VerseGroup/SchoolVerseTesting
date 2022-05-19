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
    private let dayPath: String = "DAYS"
    private let schedulePath: String = "SCHEDULES"
    private let db = Firestore.firestore()
    
    @Published var dayEvents: [DayEvent] = [] // which days are day 1,2,3,4,5,6,7,...
    @Published var schedule: Schedule? // user's schedule
    
    @Published var errorMessage: String?
    
    init() {
        loadDays()
        loadSchedule()
    }
    
    // loads the days
    func loadDays() {
        db.collection(dayPath)
            .addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    self?.errorMessage = "No days found"
                    return
                }
                self?.dayEvents = documents.compactMap({ queryDocumentSnapshot in
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
    
    // loads user's schedule
    func loadSchedule() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // change to userId later
        let docRef = db.collection(schedulePath).document(userId)
        
        docRef.getDocument(as: Schedule.self) { result in
            switch result {
            case .success(let schedule):
                self.errorMessage = nil
                self.schedule = schedule
            case .failure(let error):
                switch error {
                case DecodingError.typeMismatch(_, let context):
                    self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                case DecodingError.valueNotFound(_, let context):
                    self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                case DecodingError.keyNotFound(_, let context):
                    self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                case DecodingError.dataCorrupted(let key):
                    self.errorMessage = "\(error.localizedDescription): \(key)"
                default:
                    self.errorMessage = "Error decoding document: \(error.localizedDescription)"
                }
                self.schedule = nil
            }
        }
    }
}
