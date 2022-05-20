//
//  SchoolVerseTestingApp.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import SwiftUI
import UIKit
import Firebase

// hooks into application lifecycle
// source: https://peterfriese.dev/posts/swiftui-new-app-lifecycle-firebase/
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

// TODO: IMPLEMENT CLASS FUNCTION AND SELECTION
@main
struct SchoolVerseTestingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // single source of truth, singleton
    @StateObject var authenticationService: AuthenticationService = AuthenticationService.instance
    
    var body: some Scene {
        WindowGroup {
            RouterView()
                .environmentObject(authenticationService)
        }
    }
}
