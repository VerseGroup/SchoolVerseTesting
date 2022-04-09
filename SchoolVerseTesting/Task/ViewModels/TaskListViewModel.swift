//
//  TaskListViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import Foundation
import Combine

// TODO: change to dependency injection (DI)

class TaskListViewModel: ObservableObject {
    private let repo = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates task cell view models
        repo.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskCellViewModel(task: task)
                }
            }
            .sink { [weak self] (returnedTaskCellVMs) in
                self?.taskCellViewModels = returnedTaskCellVMs
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
