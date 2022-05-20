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
            Form {
                Section("Email") {
                    Text(authenticationService.user?.email ?? "nil")
                }
                Section("Sign out") {
                    Button {
                        authenticationService.signOut()
                    } label: {
                        Text("Sign out")
                            .bold()
                            .frame(maxWidth: .infinity)
                    }
                    .tint(.purple) // change to custom color scheme later
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                }
            }
            
        }
        .navigationTitle("Account")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
