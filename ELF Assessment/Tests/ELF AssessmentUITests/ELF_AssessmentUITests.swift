//
//  ELF_AssessmentUITests.swift
//  ELF AssessmentUITests
//
//  Created by Shivra on 10/04/26.
//

import XCTest

import XCTest

final class ELF_AssessmentUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    // MARK: - TableView UI Test
    @MainActor
    func testTableViewDisplaysData() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        // Access tableView using accessibility identifier
        let tableView = app.tables["repoTableView"]
        
        // Verify table exists
        XCTAssertTrue(tableView.waitForExistence(timeout: 5), "TableView should exist")
        
        // Verify at least one cell is present
        let firstCell = tableView.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "TableView should display data")
    }

    // MARK: - Launch Performance
    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    @MainActor
    func testAppLaunch() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.exists)
    }
}
