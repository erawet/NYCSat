//
//  TestSchooleDetails.swift
//  20230821-DonWettasinghe-NYCSchoolsUITests
//
//  Created by Eranga on 8/22/23.
//

import XCTest

final class TestSchooleDetails: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()

    }
    
    func testSchoolSelection() throws {

        app.launch()
    
        let cellText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Marta Valle High School"]/*[[".cells.staticTexts[\"Marta Valle High School\"]",".staticTexts[\"Marta Valle High School\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cellText.tap()
        
        let averageScoreText = app.staticTexts["Average Scores"]
        averageScoreText.tap()
        XCTAssertTrue(averageScoreText.exists)
                
        
    }
}
