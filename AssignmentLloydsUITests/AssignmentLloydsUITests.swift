//
//  AssignmentLloydsUITests.swift
//  AssignmentLloydsUITests
//
//  Created by Manoj kumar Dixit on 16/12/22.
//

import XCTest

final class AssignmentLloydsUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testTableView() {
        app.launch()
        let redditListTableView = app.tables["table--redditListTableView"]
        XCTAssertTrue(redditListTableView.exists, "The reddit list tableview exists")
        let tableCells = redditListTableView.cells
        XCTAssert(tableCells.element.waitForExistence(timeout: 5.0))
        if tableCells.count > 0 {
            XCTAssertTrue(redditListTableView.cells.count == 25)
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
    func test_TapOnTableView() {
        app.launch()
        let redditListTableView = app.tables["table--redditListTableView"]
        XCTAssertTrue(redditListTableView.exists, "The reddit list tableview exists")
        let tableCells = redditListTableView.cells
        XCTAssert(tableCells.element.waitForExistence(timeout: 5.0))
        if tableCells.count > 0 {
            let lastRowIndex = app.tables.children(matching: .cell).count - 1
            app.tables.cells.element(boundBy: lastRowIndex).tap()
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
