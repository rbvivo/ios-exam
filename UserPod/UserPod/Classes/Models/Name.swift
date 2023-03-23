//
//  Name.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation

struct Name: Codable {
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
}
