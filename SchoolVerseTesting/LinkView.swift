//
//  LinkView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/18/22.
//

import SwiftUI

// test linking view
struct LinkView: View {
    @StateObject var vm: APIService = APIService()
    
    var body: some View {
        VStack {
            Text("link status: \(vm.linkStatus?.description ?? "")")
            Text("link exception: \(vm.linkException ?? "no unknown exceptions :)")")
        }
        .onAppear {
            vm.link(platform: .schoology, username: "username", password: "password")
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
