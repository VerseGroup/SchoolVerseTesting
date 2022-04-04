//
//  NewTaskView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: implement choosing a course (probably an array)
// TODO: add error checking to make sure task is not empty
struct NewTaskView: View {
    @ObservedObject var taskListVM: TaskListViewModel
    @State var newTask: Task = Task(id: nil, name: "", completed: false, dueDate: Date.now, description: "", courseId: "", courseName: "", userId: nil)
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            Section(header: Text("Task Details")) {
                TextField("Enter a task name", text: $newTask.name)
                TextField("Enter a task description", text: $newTask.description)
                DatePicker("Due Date", selection: $newTask.dueDate, displayedComponents: [.date, .hourAndMinute])
                Toggle(isOn: $newTask.completed) {
                    Text("Finished")
                }
            }
            
            // change to a picker that chooses from user's array
            Section(header: Text("Course Details")) {
                TextField("Enter a course name", text: $newTask.courseName)
                TextField("Enter a course ID", text: $newTask.courseId)
            }
            
            // change to viewmodifier later
            // source: https://stackoverflow.com/questions/56692933/swiftui-centre-content-on-a-list
            Section() {
                Button() {
                    taskListVM.addTask(task: newTask)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add Task")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .tint(.purple) // change to custom color scheme later
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
            }                        .listRowBackground(EmptyView())
            
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Add a Task")
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskListVM: TaskListViewModel())
    }
}
