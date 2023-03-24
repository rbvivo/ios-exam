//
//  UserService.swift
//  NetworkPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation
import Moya

public enum UserService {
    case getUserList(params: [String: Any])
}

extension UserService: TargetType {
    
    public var task: Moya.Task {
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
    
    public var baseURL: URL {
        return URL(string: "https://randomuser.me/")!
    }
    
    public var path: String {
        switch self {
        case .getUserList(_):
            return "api"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getUserList:
            return .get
        }
    }
    
    public var sampleData: Data {
        var url: URL?
        switch self {
        case .getUserList(let params):
            if let page = params["page"] as? Int {
                if page == 1  {
                    url = Bundle(for: CachePolicyPlugin.self).url(forResource: "UserListManyUsers", withExtension: "json")
                } else {
                    url = Bundle(for: CachePolicyPlugin.self).url(forResource: "UserListOneUser", withExtension: "json")
                }
            }
        }
        
        if let testUrl = url, let data = try? Data(contentsOf: testUrl) {
            return data
        } else {
            return Data()
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
}

extension UserService: CachePolicyGettable {
    public var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .getUserList:
            return .returnCacheDataElseLoad
        }
    }
}
