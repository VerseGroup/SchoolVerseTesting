//
//  AuthenticationView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/4/22.
//

import SwiftUI

struct AuthenticationView: View {
    @State var showSignInView: Bool = false
    @State var showSignUpView: Bool = false
    
    var body: some View {
        VStack {
            Button {
                showSignInView.toggle()
            } label: {
                Text("Sign In")
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            .tint(.purple) // change to custom color scheme later
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            
            Button {
                showSignUpView.toggle()
            } label: {
                Text("Sign Up")
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            .tint(.purple) // change to custom color scheme later
            .controlSize(.large)
            .buttonStyle(.borderedProminent)

        }
        .sheet(isPresented: $showSignInView) {
            SignInView()
        }
        .sheet(isPresented: $showSignUpView) {
            SignUpView()
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
