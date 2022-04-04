//
//  ContentView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var repo = TaskRepository()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        ForEach(repo.tasks) { task in
            Text("\(task.name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
