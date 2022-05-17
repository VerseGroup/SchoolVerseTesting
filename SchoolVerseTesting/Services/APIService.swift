//
//  APIService.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/16/22.
//

import Foundation
import Firebase
import Combine
import Alamofire

// TODO: Check if server up (done)
// TODO: add debounce (done)
// TODO: add front-facing alerts to user that request has been shown

class APIService: ObservableObject {
    
    let baseURL = "https://schoolverse-webscraper.herokuapp.com"
    @Published var status: Bool = false
    
    // scraping vars
    @Published var scrapeStatus: ScrapeMessage = .error // default is error
    @Published var scrapeException: String?
    
    // linking vars
    
    init() {
        ping()
    }
    
    // scraping function, auth_token not authorized, platform_code is always "sc" for now
    func scrape() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("user not initialized")
            return
        }
        
        let parameters: [String: String] = [
            "user_id": userId,
            "platform_code": "sc",
            "auth_token": "",
        ]
        
        AF.request(baseURL + "/scrape", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .cURLDescription { description in
//                print(description)
//            }
//            .response(completionHandler: { data in
//                debugPrint(data)
//            })
            .responseDecodable(of: ScrapeResponse.self) { response in
                debugPrint("scrape response: \(response.description)")
                self.scrapeException = response.value?.exception
                self.scrapeStatus = response.value?.message ?? .error
            }
    }
    
    // checks if server is up
    func ping() {
        AF.request(baseURL + "/ping")
            .validate()
            .response { response in
                self.status = true
                debugPrint(response)
            }
    }
}
