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

// TODO: Add api /adduser for postgres heroku
class AuthenticationService: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    
    private var api: APIService = APIService()
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    private var cancellables = Set<AnyCancellable>()
    
    // singleton class, perhaps change later to DI
    static let instance = AuthenticationService()
    
    private init() {
        print("Authentication Service initialized")
        addSubscribers()
        registerStateListener()
    }
    
    deinit {
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    private func addSubscribers() {
        
        // waits 5 seconds after errorMessage is changed to erase the errorMessage
        $errorMessage
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { _ in
                self.errorMessage = nil
            }
            .store(in: &cancellables)
        
    }
    
    // source: https://peterfriese.dev/posts/replicating-reminder-swiftui-firebase-part2/
    // listens for user session (checks if user is signed in, signed out, user account is available, etc.)
    // handles all the session activities automatically, other functions should not handle isAuthenticated and user
    // source: https://firebase.google.com/docs/auth/ios/start
    func registerStateListener() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.user = user
                self.isAuthenticated = true
                print("\(user.uid) has signed in.")
            } else {
                self.user = user
                self.isAuthenticated = false
                print("User N/A")
            }
        }
    }
    
    // async/await sign in
    // source: https://peterfriese.dev/posts/firebase-async-calls-swift/
    @MainActor
    func signIn(creds: CredentialDetails) async {
        do {
            try await Auth.auth().signIn(withEmail: creds.email, password: creds.password)
        }
        catch {
            print("There was an issue when trying to sign in: \(error)")
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("There was an issue when trying to sign out: \(error)")
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    // need more sign up info soon
    @MainActor
    func signUp(creds: CredentialDetails) async {
        do {
            try await Auth.auth().createUser(withEmail: creds.email, password: creds.password)
            api.addUser()
        } catch {
            print("There was an issue when trying to sign in: \(error)")
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
//    func addUserDocument() {
//        let collectionRef = db.collection("USERS")
//        do {
//            let newDocReference = try collectionRef.addDocument(from: _______)
//            print("User stored with new document reference: \(newDocReference)")
//        } catch {
//            errorMessage = error.localizedDescription
//        }
//    }
}
