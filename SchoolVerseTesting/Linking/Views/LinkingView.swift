//
//  LinkingView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import SwiftUI

struct LinkingView: View {
    @StateObject var vm: LinkingViewModel = LinkingViewModel()
    
    @State var platform: Platform = .schoology
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Form {
                Picker("Platform", selection: $platform) {
                    ForEach(Platform.allCases, id:\.self) { platform in
                        Text(platform.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                
                Button {
                    vm.link(platform: platform, username: username, password: password)
                } label: {
                    Text("Link")
                }
                .tint(.purple) // change to custom color scheme later
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Link")
        .banner(title: vm.bannerTitle, detail: vm.bannerDetail, show: $vm.showBanner)
    }
}

struct LinkingView_Previews: PreviewProvider {
    static var previews: some View {
        LinkingView()
    }
}
