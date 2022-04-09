//
//  NewTaskViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import Foundation
import Combine

class AddTaskViewModel: ObservableObject {
    private let repo = TaskRepository()
    @Published var newTask: SchoolTask = SchoolTask(id: nil, name: "", completed: false, dueDate: Date.now, description: "", courseId: "", courseName: "", userId: nil)
    @Published var errorMessage: String?
    @Published var isValid: Bool = false
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $newTask
            .map { task in
                return (task.name != "")
            }
            .sink { [weak self] valid in
                self?.isValid = valid
            }
            .store(in: &cancellables)
    }
    
    func addTask() {
        repo.addTask(newTask)
    }
}
