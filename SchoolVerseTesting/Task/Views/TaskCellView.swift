//
//  TaskCellView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: add date picker
struct TaskCellView: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var body: some View {
        HStack() {
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    withAnimation(.easeIn) {
                        self.taskCellVM.task.completed.toggle()
                    }
                }
            
            Spacer()
            
            VStack(alignment: .leading) {
                TextField("Enter task title", text: $taskCellVM.task.name)
                    .font(.headline)
                
                TextField("Enter description", text: $taskCellVM.task.description)
                    .font(.subheadline)
                
                // change to date picker
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
        TaskCellView(taskCellVM: TaskCellViewModel(task: SchoolTask(id: "0", name: "test", completed: false, dueDate: Date.now, description: "description", courseId: "course id", courseName: "calculus", userId: "0")))
    }
}
