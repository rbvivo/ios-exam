//
//  Address.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation
struct Address: Codable {
    var city: String?
    var state: String?
    var country: String?
    var street: Street?
    
    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
        case street
    }
}

struct Street: Codable {
    var number: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case name
    }
}
