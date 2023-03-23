//
//  UserService.swift
//  NetworkPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation
import Moya

enum UserService {
    case getUserList(params: [String: Any])
}

extension UserService: TargetType {
    
    var task: Moya.Task {
        var encoding: ParameterEncoding = URLEncoding.default
        switch method {
        case .post:
            encoding = JSONEncoding.default
        default:
            encoding = URLEncoding.default
        }
        
        switch self {
        case .getUserList(let params):
            return .requestParameters(parameters: params, encoding: encoding)
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://randomuser.me/")!
    }
    
    var path: String {
        switch self {
        case .getUserList(_):
            return "api"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
   
  
}
