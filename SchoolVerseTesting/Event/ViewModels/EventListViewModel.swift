//
//  EventListViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import Foundation
import Combine

class EventListViewModel: ObservableObject {
    private let repo = EventRepository()
    @Published var events = [Event]()
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates event cell view model
        repo.$events
            .sink { [weak self] (returnedEvents) in
                self?.events = returnedEvents
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
