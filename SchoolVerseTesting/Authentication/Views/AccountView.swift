//
//  AccountView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authenticationService: AuthenticationService
    
    var body: some View {
        VStack {
            Button {
                authenticationService.signOut()
            } label: {
                Text("Sign out")
            }
            .tint(.purple) // change to custom color scheme later
            .controlSize(.large)
            .buttonStyle(.borderedProminent)

        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
