//
//  UserListTest.swift
//  ios-examTests
//
//  Created by Bryan Vivo on 3/24/23.
//

import XCTest
@testable import ios_exam
import UserPod

final class UserListTest: XCTestCase {

    func testLoadMore() {
        let viewModel = UserListViewModel(true)
        viewModel.getUsers()
        XCTAssertTrue(viewModel.loadMore, "Should load more")
        viewModel.getUsers()
        XCTAssertFalse(viewModel.loadMore, "Should not load more")
    }

}

