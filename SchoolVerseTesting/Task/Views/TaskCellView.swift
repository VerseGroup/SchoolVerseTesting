//
//  TaskCellView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: add date picker
struct TaskCellView: View {
    @ObservedObject var vm: TaskCellViewModel
    @State var showTaskDetailView: Bool = false
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: vm.task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    withAnimation(.easeIn) {
                        self.vm.task.completed.toggle()
                    }
                }
            
            VStack(alignment: .leading) {
                Text(vm.task.name)
                    .font(.headline)
                
                Text(vm.task.description)
                    .font(.subheadline)
                    .lineLimit(2)
                
                // change to date
                Text(vm.task.dueDate.asFormattedDateString())
            }
            .onTapGesture {
                showTaskDetailView.toggle()
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(10)
        .sheet(isPresented: $showTaskDetailView) {
            NavigationView {
                TaskDetailView(vm: vm)
            }
        }
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        TaskCellView(vm: TaskCellViewModel(task: SchoolTask(id: "0", name: "test", completed: false, dueDate: Date.now, description: "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription", courseId: "course id", courseName: "calculus", userId: "0")))
        }
    }
}
