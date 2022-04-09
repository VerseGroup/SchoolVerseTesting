//
//  TaskDetailView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import SwiftUI

struct TaskDetailView: View {
    @ObservedObject var vm: TaskCellViewModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack() {
                        Image(systemName: vm.task.completed ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                withAnimation(.easeIn) {
                                    self.vm.task.completed.toggle()
                                }
                            }
                        
                        ZStack(alignment: .leading) {
                            Text(vm.task.name)
                                .padding([.leading, .trailing], 5)
                                .padding([.top, .bottom], 8)
                                .foregroundColor(Color.clear)
                            TextEditor(text: $vm.task.name)
                        }
                        .font(.title2.bold())
                    }
                    
                    // hacky workaround
                    // source: https://developer.apple.com/forums/thread/651210
                    // TODO: EXTRACT TO CUSTOM VIEW
                    ZStack(alignment: .leading) {
                        Text(vm.task.description)
                            .padding([.leading, .trailing], 5)
                            .padding([.top, .bottom], 8)
                            .foregroundColor(Color.clear)
                        TextEditor(text: $vm.task.description)
                    }
                    .font(.subheadline)
                }

                Section {
                    DatePicker("Due Date", selection: $vm.task.dueDate, displayedComponents: [.date, .hourAndMinute])
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Dummy text")
            .sheet(isPresented: .constant(true)) {
                NavigationView {
                    TaskDetailView(vm: TaskCellViewModel(task: SchoolTask(id: "0", name: "title1", completed: false, dueDate: Date.now, description: "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription", courseId: "course id", courseName: "calculus", userId: "0")))
                }
            }
    }
}
