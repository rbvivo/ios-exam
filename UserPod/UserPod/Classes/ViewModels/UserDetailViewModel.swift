//
//  UserDetailViewModel.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import Foundation

public class UserDetailViewModel {
    public var user: User?
    
    public init(user: User?) {
        self.user = user
    }
    
    public func convertDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: dateString) {
            let newDateFormat = DateFormatter()
            newDateFormat.dateFormat = "MMM d, yyyy"
            newDateFormat.timeZone = TimeZone(abbreviation: "UTC")
            return newDateFormat.string(from: date)
        }
        return ""
    }
}
