//
//  SportsListViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import Foundation
import Combine

class SportsListViewModel: ObservableObject {
    private let repo = SportsRepository()
    @Published var sports = [SportsEvent]()
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates sports cell view model
        repo.$sports
            .sink { [weak self] (returnedSports) in
                self?.sports = returnedSports
            }
            .store(in: &cancellables)
        
        // updates error message
        repo.$errorMessage
            .sink { [weak self] (returnedErrorMessage) in
                self?.errorMessage = returnedErrorMessage
            }
            .store(in: &cancellables)
    }
}
