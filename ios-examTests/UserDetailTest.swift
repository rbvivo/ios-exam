//
//  UserDetailTest.swift
//  ios-examTests
//
//  Created by Bryan Vivo on 3/24/23.
//

import XCTest
@testable import ios_exam
import UserPod

final class UserDetailTest: XCTestCase {

    func testDate() {
        let viewModel = UserDetailViewModel(user: nil)
        XCTAssertEqual("Jul 21, 1961", viewModel.convertDate(dateString: "1961-07-21T17:16:32.809Z"))
    }

}
