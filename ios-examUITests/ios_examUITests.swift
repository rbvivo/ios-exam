//
//  ios_examUITests.swift
//  ios-examUITests
//
//  Created by Bryan Vivo on 3/22/23.
//

import XCTest

final class ios_examUITests: XCTestCase {

    var app = XCUIApplication()

    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    func testMainScreen() {
        givenAppIsLaunched()
        givenIAmOnTheMainScreen()
        thenIShouldSeeAstronomyTable()
        andITapAUser()
        thenIShouldSeeUserDetails()
    }
}

extension ios_examUITests {
    func givenAppIsLaunched() {
           XCTContext.runActivity(named: "Given the application is ready") { _ in
               XCTAssertEqual(app.state, .runningForeground)
           }
       }
    
    func givenIAmOnTheMainScreen() {
        XCTContext.runActivity(named: "Given the user is on the main screen") { _ in
            let root = app.navigationBars["rootView"]
            wait(forElement: root)
        }
    }
    
    func thenIShouldSeeAstronomyTable() {
        XCTContext.runActivity(named: "Then I should see a user list") { _ in
            let userTableViewElement = app.tables["userListTableView"]
            wait(forElement: userTableViewElement)
            XCTAssertTrue(userTableViewElement.exists)
        }
    }
    
    func andITapAUser() {
        let userCell = app.tables["userListTableView"].cells["userCell0"]
        wait(forElement: userCell)
        userCell.tap()
    }
    
    func thenIShouldSeeUserDetails() {
        XCTContext.runActivity(named: "Then I should see user details") { _ in
            XCTAssertTrue( app.staticTexts["nameLabel"].exists)
            XCTAssertTrue( app.staticTexts["addressLabel"].exists)
            XCTAssertTrue(app.staticTexts["mobileLabel"].exists)
            XCTAssertTrue( app.staticTexts["birthLabel"].exists)
            XCTAssertTrue( app.staticTexts["emailLabel"].exists)
        }
    }
    
}

extension XCTestCase {
    func wait(forElement element: XCUIElement, timeout: TimeInterval = 5.0) {
        let predicate = NSPredicate(format: "exists == 1")
        // This will make the test runner continously evalulate the
        // predicate, and wait until it matches.
        let expection = expectation(for: predicate, evaluatedWith: element, handler: nil)
        let waitResult = XCTWaiter.wait(for: [expection], timeout: timeout)
        switch waitResult {
        case .completed:
            break
        default:
            XCTFail("Failed to find element \(element)")
        }
    }
}
