//
//  TaskCellViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import Foundation
import Combine

// might need icon name
class TaskCellViewModel: ObservableObject, Identifiable {
    private let repo = TaskRepository()
    @Published var task: SchoolTask
    
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: SchoolTask) {
        self.task = task
        
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // update task id (for Identifiable)
        $task
            .compactMap { task in
                task.id
            }
            .sink { [weak self] (id) in
                self?.id = id
            }
            .store(in: &cancellables)
        
        // updates task when event happens
        $task
            .dropFirst()
            .debounce(for: 5, scheduler: RunLoop.main) // ensures changes aren't published immediately, have to wait 5 seconds
            .sink { task in
                self.updateTask()
            }
            .store(in: &cancellables)
    }
    
    func updateTask() {
        repo.updateTask(task)
    }
    
    func removeTask() {
        repo.removeTask(task)
    }
}
