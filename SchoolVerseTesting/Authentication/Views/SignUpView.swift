//
//  SignUpView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/4/22.
//

import SwiftUI

struct SignUpView: View {
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
                        await authenticationService.signUp(creds: creds)
                    }
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .tint(.purple) // change to custom color scheme later
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                // FIX
//                if let error = authenticationService.errorMessage {
//                    Text(error)
//                }
            }
            .navigationTitle("Sign Up")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
