//
//  LinkingViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import Foundation
import Combine

class LinkingViewModel: ObservableObject {
    private let api: APIService = APIService()
    
    @Published var platform: Platform = .schoology
    
    @Published var linkStatus: LinkMessage?
    @Published var linkException: String?
    
    @Published var showBanner: Bool = false
    @Published var bannerTitle: String = ""
    @Published var bannerDetail: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        api.$linkStatus
            .sink { [weak self] (linkStatus) in
                self?.linkStatus = linkStatus
                
                self?.bannerTitle = linkStatus?.description ?? "No status"
                self?.showBanner = true
            }
            .store(in: &cancellables)
        
        api.$linkException
            .sink { [weak self] (linkException) in
                self?.linkException = linkException
                
                self?.bannerDetail = linkException
            }
            .store(in: &cancellables)
    }
    
    func link(platform: Platform,  username: String, password: String) {
        api.link(platform: platform, username: username, password: password)
    }
}
