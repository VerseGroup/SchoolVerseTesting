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
    @Published var scrapeStatus: ScrapeMessage?
    @Published var scrapeException: String?
    
    // linking vars
    @Published var linkStatus: LinkMessage?
    @Published var linkException: String?
    
    // add user vars
    @Published var addUserStatus: AddUserMessage?
    @Published var addUserException: String?
    
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
                self.scrapeStatus = response.value?.message
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
    
    // links user's credentials (schoology or veracross) to a SchoolVerse account
    func link(platform: Platform,  username: String, password: String) {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("user not initialized")
            return
        }
        
        let parameters: [String: String] = [
            "user_id": userId,
            "auth_token": "",
            "platform_code": platform.rawValue,
            "username": username,
            "password": password
        ]
        
        AF.request(baseURL + "/link", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//                    .cURLDescription { description in
//                        print(description)
//                    }
//                    .response(completionHandler: { data in
//                        debugPrint(data)
//                    })
            .responseDecodable(of: LinkResponse.self) { response in
                debugPrint("link response: \(response.description)")
                self.linkStatus = response.value?.message
                self.scrapeException = response.value?.exception
            }
    }
    
    // add user functionality (called on sign up)
    func addUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("user not initialized")
            return
        }
        
        let parameters: [String: String] = [
            "user_id": userId,
            "auth_token": ""
        ]
        
        AF.request(baseURL + "/adduser", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .cURLDescription { description in
//                print(description)
//            }
//            .response(completionHandler: { data in
//                debugPrint(data)
//            })
            .responseDecodable(of: AddUserResponse.self) { response in
                debugPrint("add user response: \(response.description)")
                self.addUserStatus = response.value?.message
                self.addUserException = response.value?.exception
            }
    }
}
