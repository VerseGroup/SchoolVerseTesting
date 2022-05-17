//
//  Models.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/16/22.
//

import Foundation
import Networking

enum ScrapeMessage: String, Codable {
    case success
    case invalidPlatformCode
    case error
    case firebaseNoUser
    case postgresNoUser
    
}

// codable functionality
extension ScrapeMessage {
    var description: String {
        get {
            switch self {
            case .success:
                return "success"
            case .invalidPlatformCode:
                return "unsupported platform code"
            case .error:
                return "error"
            case .firebaseNoUser:
                return "user does not exist in firebase"
            case .postgresNoUser:
                return "user does not exist postgres"
            }
        }
    }
    
    static func getMessage(message: String) -> ScrapeMessage {
        switch message {
        case "success":
            return .success
        case "unsupported platform code":
            return .invalidPlatformCode
        case "error":
            return .error
        case "user does not exist in firebase":
            return .firebaseNoUser
        case "user does not exist postgres":
            return .postgresNoUser
        default:
            return .error
        }
    }
}

struct ScrapeResponse: Codable {
    let message: String
    let exception: String? // only happens when ScrapeMessage.error
}

//extension ScrapeResponse: NetworkingJSONDecodable {}
