//
//  TasksView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// TODO: in the production app, add DI in tasklistvm, so you can add a dummy test data cell taskrepo
// TODO: implement moving and deleting
// TODO: ADD ALERT (LIKE NOTIFICATION RINGER) THAT AUTO DISMISSES BASED ON API SERVICE/SCRAPE SERVICE

struct TasksView: View {
    // ensures screen doesn't blink
    @StateObject var taskListVM = TaskListViewModel()
    
    @State private var showAddTaskView: Bool = false
    
    //        Text("API status = \(taskListVM.apiStatus.description)") // ugly, fix later pls
    //
    //        // change to error pop up stuff
    //        if let scrapeStatus = taskListVM.scrapeStatus {
    //            Text("scrape status = \(scrapeStatus.description)")
    //            Text("scrape error = \(taskListVM.scrapeException ?? "no error")")
    //        }
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                    TaskCellView(vm: taskCellVM)
                        .listRowBackground(EmptyView())
                        .listRowSeparator(.hidden)
                }
            }
            .refreshable {
                taskListVM.scrape()
            }
        }
        .onAppear(perform: {
            taskListVM.pingAPI() // checks if API is online
        })
        .navigationTitle("Tasks")
        .listStyle(.sidebar)
        .sheet(isPresented: $showAddTaskView, content: {
            NavigationView {
                AddTaskView()
            }
        })
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    showAddTaskView.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .banner(title: taskListVM.bannerTitle, detail: taskListVM.bannerDetail, show: $taskListVM.showBanner)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
