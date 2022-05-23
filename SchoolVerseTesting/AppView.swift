//
//  AppView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import SwiftUI
import SwiftfulUI

struct AppView: View {
    
    //    @State private var selection = 0
    //
    ////    var body: some View {
    ////        TabBarViewBuilder {
    ////            NavigationView {
    ////                TasksView()
    ////            }
    ////            .tabBarItem(tab: 0, selection: selection)
    ////
    ////            NavigationView {
    ////                ScheduleView()
    ////            }
    ////            .tabBarItem(tab: 1, selection: selection)
    ////
    ////            NavigationView {
    ////                MoreView()
    ////            }
    ////            .tabBarItem(tab: 2, selection: selection)
    ////
    ////        } tabBar: {
    ////            HStack {
    ////                Image(systemName: "list.bullet.rectangle.portrait")
    ////                    .onTapGesture {
    ////                        selection = 0
    ////                    }
    ////
    ////                Spacer()
    ////
    ////                Image(systemName: "calendar")
    ////                    .onTapGesture {
    ////                        selection = 1
    ////                    }
    ////
    ////                Spacer()
    ////
    ////                Image(systemName: "line.3.horizontal")
    ////                    .onTapGesture {
    ////                        selection = 2
    ////                    }
    ////            }
    ////            .frame(maxWidth: .infinity)
    ////        }
    ////    }
    
    //    var body: some View {
    //        TabView {
    //            // tasks
    //            NavigationView {
    //                TasksView()
    //            }
    //            .tabItem {
    //                Image(systemName: "list.bullet.rectangle.portrait")
    //            }
    //
    //            // schedule
    //            NavigationView {
    //                ScheduleView()
    //            }
    //            .tabItem {
    //                Image(systemName: "calendar")
    //            }
    //
    //            // More View
    //            NavigationView {
    //                MoreView()
    //            }
    //            .tabItem {
    //                Image(systemName: "line.3.horizontal")
    //            }
    //        }
    //    }
    
    @State private var selection: String = "tasks"
    @State private var tabSelection: TabBarItem = .tasks
    
    var body: some View {
        TabBarContainerView(selection: $tabSelection) {
            // home add later
            //            NavigationView {
            //                HomeView()
            //            }
            //            .tabBarItem(tab: .home, selection: $tabSelection)
            
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
            NavigationView {
                MoreView()
            }
            .tabBarItem(tab: .more, selection: $tabSelection)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
