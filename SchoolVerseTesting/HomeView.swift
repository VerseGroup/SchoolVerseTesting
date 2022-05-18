//
//  HomeView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Spacer()
                }
                
                Text("Welcome to SchoolVerse!")
                
                HStack(spacing: 50) {
                    NavigationLink {
                        TasksView()
                    } label: {
                        Text("Tasks")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(5)
                    }
                    
                    NavigationLink {
                        MenusView()
                    } label: {
                        Text("Menus")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(5)
                    }
                    
                    NavigationLink {
                        ScheduleView()
                    } label: {
                        Text("Schedule")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(5)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
