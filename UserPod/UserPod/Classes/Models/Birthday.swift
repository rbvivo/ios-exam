//
//  Birthday.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation
struct Birthday: Codable {
    var date: String?
    var age: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case age
    }
}
