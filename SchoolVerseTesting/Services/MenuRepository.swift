//
//  MenuRepository.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class MenuRepository: ObservableObject {
    private let path: String = "MENUS"
    private let db = Firestore.firestore()
    
    @Published var menus: [Menu] = []
    @Published var errorMessage: String?
    
    init() {
        loadMenus()
    }
    
    func loadMenus() {
        db.collection(path)
            .addSnapshotListener { [weak self] (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    self?.errorMessage = "No menus yet"
                    return
                }
                self?.menus = documents.compactMap({ queryDocumentSnapshot in
                    let result = Result { try queryDocumentSnapshot.data(as: Menu.self) }
                    
                    switch result {
                    case .success(let task):
                        self?.errorMessage = nil
                        return task
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
