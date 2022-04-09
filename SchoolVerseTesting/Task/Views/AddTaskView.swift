//
//  AddTaskView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: implement choosing a course (probably an array)
// TODO: add error checking to make sure task is not empty

// NOTE: view deinitializes when dismissed
struct AddTaskView: View {
    @ObservedObject var vm: AddTaskViewModel = AddTaskViewModel()
    
    // replaces presentationMode
    // source: https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Section(header: Text("Task Details")) {
                TextField("Enter a task name", text: $vm.newTask.name)
                TextField("Enter a task description", text: $vm.newTask.description)
                DatePicker("Due Date", selection: $vm.newTask.dueDate, displayedComponents: [.date, .hourAndMinute])
                Toggle(isOn: $vm.newTask.completed) {
                    Text("Finished")
                }
            }
            
            // change to a picker that chooses from user's array
            Section(header: Text("Course Details")) {
                TextField("Enter a course name", text: $vm.newTask.courseName)
                TextField("Enter a course ID", text: $vm.newTask.courseId)
            }
            
            // change to viewmodifier later
            // source: https://stackoverflow.com/questions/56692933/swiftui-centre-content-on-a-list
            Section() {
                Button() {
                    vm.addTask()
                    dismiss()
                } label: {
                    Text("Add Task")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .disabled(!self.vm.isValid)
                .tint(.purple) // change to custom color scheme later
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
            }                        .listRowBackground(EmptyView())
            
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Add a Task")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
