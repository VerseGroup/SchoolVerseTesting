//
//  TasksView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: in the production app, add DI in tasklistvm, so you can add a dummy test data cell taskrepo
// TODO: implement moving and deleting
struct TasksView: View {
    // ensures screen doesn't blink
    @StateObject var taskListVM = TaskListViewModel()
    
    @State private var showAddTaskView: Bool = false
    @State private var showAccountView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                    TaskCellView(taskCellVM: taskCellVM)
                        .listRowBackground(EmptyView())
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        showAccountView.toggle()
                    } label: {
                        Label("Account", systemImage: "person.crop.circle")
                    }
                
                    Button {
                        showAddTaskView.toggle()
                    } label: {
                        Label("New", systemImage: "plus")
                    }
            }
        }
        .navigationTitle("Tasks")
        .listStyle(.sidebar)
        .sheet(isPresented: $showAddTaskView, content: {
            NavigationView {
                NewTaskView(taskListVM: taskListVM)
            }
        })
        .sheet(isPresented: $showAccountView) {
            NavigationView {
                AccountView()
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
