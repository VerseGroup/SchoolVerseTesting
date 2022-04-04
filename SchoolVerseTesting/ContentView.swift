//
//  ContentView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

// this is just a test view, will prob be replaced by a router view


struct ContentView: View {
    @ObservedObject var repo = TaskRepository()
    
    var body: some View {
        NavigationView {
            TasksView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
