//
//  BabbelTestTests.swift
//  BabbelTestTests
//
//  Created by Fredy Shaji on 2022-08-15.
//

import XCTest
@testable import BabbelTest

class BabbelTestTests: XCTestCase {

    var sut: WordGameViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "WordGameViewController") as? WordGameViewController
        sut.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testFetchData() {
        sut.viewModel.fetchData()
        XCTAssertEqual(sut.viewModel.wordsArray.count, 297)
    }

    func testTimerAction() {
        sut.viewModel.fetchData()
        sut.loadQuestion()
        sut.timer.invalidate() // invalidated the timer to stop loading more questions
        sut.timerAction()
        XCTAssertEqual(sut.viewModel.questionCount, 1)
        sut.loadQuestion()
        sut.timer.invalidate()
        sut.timerAction()
        XCTAssertEqual(sut.viewModel.questionCount, 2)
    }

    func testCheckAnswer() {
        sut.viewModel.fetchData()
        guard let wordOne = sut.viewModel.wordsArray.first,
              let wordTwo = sut.viewModel.wordsArray.last else { return }

        //Check for correct word pair
        sut.viewModel.currentQuestion = wordOne
        XCTAssertTrue(sut.viewModel.checkAnswer())

        //Check for correct word pair
        sut.viewModel.currentQuestion = WordGame(spanishText: wordOne.spanishText, englishText: wordTwo.englishText)
        XCTAssertFalse(sut.viewModel.checkAnswer())
    }
}
