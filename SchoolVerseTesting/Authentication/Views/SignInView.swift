//
//  SignInView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/4/22.
//

import SwiftUI

// TODO: Fix authentication error
struct SignInView: View {
    @EnvironmentObject var authenticationService: AuthenticationService
    @State var creds: CredentialDetails = CredentialDetails(email: "", password: "")
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter email", text: $creds.email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                SecureField("Enter password", text: $creds.password)
                
                Button {
                    Task {
                        await authenticationService.signIn(creds: creds)
                    }
                } label: {
                    Text("Sign in")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .tint(.purple) // change to custom color scheme later
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Sign In")
            
            // FIX
//            if let error = authenticationService.errorMessage {
//                Text(error)
//            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
