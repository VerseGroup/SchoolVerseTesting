//
//  HomeView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

struct HomeView: View {
    @State var show: Bool = false
    var body: some View {
        VStack {
            Text("Home")
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
