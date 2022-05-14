//
//  RouterView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/8/22.
//

import SwiftUI

struct RouterView: View {
    @EnvironmentObject var authenticationService: AuthenticationService
    
    var body: some View {
        if authenticationService.isAuthenticated {
            HomeView()
        } else {
            AuthenticationView()
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
