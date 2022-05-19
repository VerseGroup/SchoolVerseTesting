//
//  AddUserModels.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/18/22.
//

import Foundation

struct AddUserResponse: Codable {
    var message: AddUserMessage
    var exception: String?
}

enum AddUserMessage: String, Codable {
    case success
    case error
}

extension AddUserMessage {
    var description: String {
        get {
            switch self {
            case .success:
                return "success"
            case .error:
                return "error"
            }
        }
    }
    
    static func getMessage(message: String) -> AddUserMessage {
        switch message {
        case "no response, assumed success":
            return .success
        case "error":
            return .error
        case "error (assumed)":
            return .error
        default:
            return .error
        }
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = AddUserMessage.getMessage(message: rawValue)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
}
