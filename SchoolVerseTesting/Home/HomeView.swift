//
//  HomeView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

// TODO: Change HomeView 
struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Hello")
                    .font(.largeTitle)
                    .bold()
            }
        }
        .navigationTitle("Home")
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
