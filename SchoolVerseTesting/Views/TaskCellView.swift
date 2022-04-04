//
//  TaskCellView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

struct TaskCellView: View {
    var taskCellVM: TaskCellViewModel
    
    var body: some View {
        HStack() {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(taskCellVM.task.name)
                    .font(.headline)
                    .bold()
                Text(taskCellVM.task.description)
                    .font(.subheadline)
                Text(taskCellVM.task.dueDate.description)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(10)
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(taskCellVM: TaskCellViewModel(task: Task(id: "0", name: "test", completed: false, dueDate: Date.now, description: "description", courseId: "course id", courseName: "calculus", userId: "0")))
    }
}
