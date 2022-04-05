//
//  AuthenticationService.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/4/22.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth
import FirebaseAuthCombineSwift

class AuthenticationService: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    
    // singleton class, perhaps change later to DI
    static let instance = AuthenticationService()
    private init() {}
    
    // async/await sign in
    // source: https://peterfriese.dev/posts/firebase-async-calls-swift/
    @MainActor
    func signIn(creds: CredentialDetails) async {
        do {
            let authDataResult = try await Auth.auth().signIn(withEmail: creds.email, password: creds.password)
            self.user = authDataResult.user
            self.isAuthenticated = true
        }
        catch {
            print("There was an issue when trying to sign in: \(error)")
            self.errorMessage = error.localizedDescription
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("There was an issue when trying to sign out: \(error)")
            self.errorMessage = error.localizedDescription
        }
    }
    
    // need more sign up info soon
    func signUp(creds: CredentialDetails) async {
        do {
            let authDataResult = try await Auth.auth().createUser(withEmail: creds.email, password: creds.password)
            self.user = authDataResult.user
            self.isAuthenticated = true
        } catch {
            print("There was an issue when trying to sign in: \(error)")
            self.errorMessage = error.localizedDescription
        }
    }
}
