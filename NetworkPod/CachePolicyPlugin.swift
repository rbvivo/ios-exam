//
//  CachePolicyPlugin.swift
//  NetworkPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation
import Moya

public protocol CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy { get }
}

public class CachePolicyPlugin: PluginType {
    
    public init() {}
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let cachePolicyGettable = target as? CachePolicyGettable {
            var mutableRequest = request
            mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
            return mutableRequest
        }

        return request
    }
}