//
//  BabbelTestUITests.swift
//  BabbelTestUITests
//
//  Created by Fredy Shaji on 2022-08-15.
//

import XCTest

class BabbelTestUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func testWordGame() throws {
        
        let app = XCUIApplication()
        let correctButton = app/*@START_MENU_TOKEN@*/.staticTexts["Correct"]/*[[".buttons[\"Correct\"].staticTexts[\"Correct\"]",".staticTexts[\"Correct\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let wrongButton = app/*@START_MENU_TOKEN@*/.staticTexts["Wrong"]/*[[".buttons[\"Wrong\"].staticTexts[\"Wrong\"]",".staticTexts[\"Wrong\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let wrongAttemptsLabel = app.staticTexts["Wrong attempts: 0"]
        let correctAttemptsLabel = app.staticTexts["Correct attempts: 0"]

        XCTAssertTrue(correctButton.exists)
        XCTAssertTrue(wrongButton.exists)
        XCTAssertTrue(wrongAttemptsLabel.exists)
        XCTAssertTrue(correctAttemptsLabel.exists)
    }
}
