//
//  LinkModels.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/18/22.
//

import Foundation

// TODO: add veracross invalid creds

// platform codes for SchoolVerse
enum Platform: String {
    case schoology = "sc"
    case veracross = "vc"
}

struct LinkResponse: Codable {
    let message: LinkMessage
    let exception: String?
}

enum LinkMessage: String, Codable {
    case success
    case error
    case scInvalidCreds
    case firebaseNoUser
    case postgresNoUser
    case postgresUserCreationFailed
}

// codable functionality
extension LinkMessage {
    var description: String {
        get {
            switch self {
            case .success:
                return "success"
            case .error:
                return "error"
            case .postgresUserCreationFailed:
                return "user creation failed"
            case .scInvalidCreds:
                return "schoology credentials are incorrect"
            case .firebaseNoUser:
                return "user does not exist in firebase"
            case .postgresNoUser:
                return "user does not exist in postgres"
            }
        }
    }
    
    static func getMessage(message: String) -> LinkMessage {
        switch message {
        case "success":
            return .success
        case "error":
            return .error
        case "user creation failed":
            return .postgresUserCreationFailed
        case "schoology credentials are incorrect":
            return .scInvalidCreds
        case "user does not exist in firebase":
            return .firebaseNoUser
        case "user does not exist in postgres":
            return .postgresNoUser
        default:
            return .error
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = LinkMessage.getMessage(message: rawValue)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
}
