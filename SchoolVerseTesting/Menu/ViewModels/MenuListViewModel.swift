//
//  MenuListViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/19/22.
//

import Foundation
import Combine

class MenuListViewModel: ObservableObject {
    private let repo = MenuRepository()
    @Published var menus = [Menu]()
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates menu cell view models
        repo.$menus
            .sink { [weak self] (returnedMenus) in
                self?.menus = returnedMenus
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
