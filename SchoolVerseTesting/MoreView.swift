//
//  MoreView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import SwiftUI

struct MoreView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                NavigationLink {
                    MenusView()
                } label: {
                    VStack {
                        Image(systemName: "menucard")
                            .font(.largeTitle)
                        Text("Menus")
                            .font(.title2)
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
                }
                
                NavigationLink {
                    EventsView()
                } label: {
                    VStack {
                        Image(systemName: "calendar.badge.exclamationmark")
                            .font(.largeTitle)
                        Text("Events")
                            .font(.title2)
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
                }
                
                NavigationLink {
                    
                } label: {
                    VStack {
                        Image(systemName: "person.text.rectangle")
                            .font(.largeTitle)
                        Text("Account")
                            .font(.title2)
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("More")
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
