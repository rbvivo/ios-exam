//
//  UserListViewModel.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation
import NetworkPod
import Moya
import RxRelay

public class UserListViewModel {
    public var userList: BehaviorRelay<[User]> = BehaviorRelay(value: [])

    public var page = 1
    public var loadMore: Bool = true
    private var mockEnabled: Bool
    
    public init(_ mockEnabled: Bool = false) {
        self.mockEnabled = mockEnabled
    }
    
    public func getUsers() {
        var moyaProvider = MoyaProvider<UserService>(plugins: [CachePolicyPlugin()])
        
        if mockEnabled {
            moyaProvider = MoyaProvider<UserService>(endpointClosure: self.customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        }
        
        moyaProvider.request(.getUserList(params: ["page": page, "results": 20])) { [weak self] result in
            var users = self?.userList.value
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                if let obj = try? decoder.decode(UserList.self, from: response.data) {
                    users?.append(contentsOf: obj.users ?? [])
                    self?.page += 1
                    self?.loadMore = !(obj.users?.count ?? 0 < 20)
                    self?.userList.accept(users ?? [])
                } else {
                    self?.loadMore = false
                    self?.userList.accept(users ?? [])
                }
                break
            case .failure(_):
                self?.loadMore = false
                self?.userList.accept(users ?? [])
            }
        }
    }
    
    private func customEndpointClosure(_ target: UserService) -> Endpoint {
        return  Endpoint(url: URL(target: target).absoluteString, sampleResponseClosure: { .networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
    }
}
