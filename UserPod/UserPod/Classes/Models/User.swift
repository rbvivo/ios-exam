//
//  User.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation

public struct User: Codable {
    var email: String?
    var name: Name?
    var birthday: Birthday?
    var cell: String?
    var address: Address?
    
    enum CodingKeys: String, CodingKey {
        case email
        case name
        case birthday = "dob"
        case cell
        case address = "location"
    }
}

public struct UserList: Codable {
    var users: [User]?
    var info: resultsInfo?
  
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
        case info
    }
}

public struct resultsInfo: Codable {
    var results: Int?
    var page: Int?
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
    }
}
