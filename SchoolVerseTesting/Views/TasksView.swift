//
//  TasksView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: in the production app, add DI in tasklistvm, so you can add a dummy test data cell taskrepo
struct TasksView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    @State var showNewTaskView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                    TaskCellView(taskCellVM: taskCellVM)
                        .listRowBackground(EmptyView())
                }
            }
        }
        .navigationTitle("Tasks")
        .listStyle(.sidebar)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
