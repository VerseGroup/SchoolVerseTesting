//
//  TestAPIView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/17/22.
//

import SwiftUI

struct TestAPIView: View {
    @StateObject var vm: APIService = APIService()
    
    var body: some View {
        ScrollView {
            VStack {
                if vm.status {
                    Text("Server works!")
                    
                    switch vm.scrapeStatus {
                    case .success:
                        Text("Success")
                    case .error:
                        Text("Error: \(vm.scrapeException ?? "")")
                    case .postgresNoUser:
                        Text("Postgres No User")
                    case .firebaseNoUser:
                        Text("Firebase No User")
                    case .invalidPlatformCode:
                        Text("Invalid platform code")
                    }
                    
                } else {
                    Text("Server no works")
                }
            }
        }
        .refreshable {
            vm.scrape()
        }
    }
}

struct TestAPIView_Previews: PreviewProvider {
    static var previews: some View {
        TestAPIView()
    }
}
