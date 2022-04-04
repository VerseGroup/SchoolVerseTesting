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
    @Published var task: Task
    
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
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
    }
    
    func updateTask() {
        repo.removeTask(task)
    }
    
    func removeTask() {
        repo.removeTask(task)
    }
}
