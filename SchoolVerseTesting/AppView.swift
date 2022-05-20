//
//  AppView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import SwiftUI

struct AppView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        TabBarContainerView(selection: $tabSelection) {
            // home
            NavigationView {
                HomeView()
            }
            .tabBarItem(tab: .home, selection: $tabSelection)
            
            // tasks
            NavigationView {
                TasksView()
            }
            .tabBarItem(tab: .tasks, selection: $tabSelection)
            
            // schedule
            NavigationView {
                ScheduleView()
            }
            .tabBarItem(tab: .schedule, selection: $tabSelection)
            
            // More View
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
