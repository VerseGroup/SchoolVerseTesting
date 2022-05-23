//
//  AppView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import SwiftUI
import SwiftfulUI

struct AppView: View {
    
    @State private var selection: TabBarItem = .tasks
    let tabs: [TabBarItem] = [.tasks, .schedule, .more]
    
    var body: some View {
        TabBarViewBuilder {
            NavigationView {
                TasksView()
            }
            .tabBarItem(tab: TabBarItem.tasks, selection: selection)
            
            NavigationView {
                ScheduleView()
            }
            .tabBarItem(tab: TabBarItem.schedule, selection: selection)
            
            NavigationView {
                MoreView()
            }
            .tabBarItem(tab: TabBarItem.more, selection: selection)
            
        } tabBar: {
            TabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
    }
}
    
    struct AppView_Previews: PreviewProvider {
        static var previews: some View {
            AppView()
        }
    }
