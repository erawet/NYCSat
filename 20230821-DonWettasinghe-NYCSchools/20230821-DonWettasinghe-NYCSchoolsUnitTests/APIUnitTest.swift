//
//  APIUnitTest.swift
//  20230821-DonWettasinghe-NYCSchoolsTests
//
//  Created by Eranga on 8/22/23.
//

import XCTest
@testable import _0230821_DonWettasinghe_NYCSchools

final class APIUnitTest: XCTestCase {
    var systemUnderTest: URLSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        systemUnderTest = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
         systemUnderTest = nil
         try super.tearDownWithError()
    }

    func testSchoolInfoApiCallGetsHTTPStatusCode200() throws {
      // given
      let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
      let url = URL(string: urlString)!
        
       /*
          Returns XCTestExpectation, stored in promise. description describes what you expect to happen.
       */
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = systemUnderTest.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
              
             /*
               Call this in the success condition closure of the asynchronous method’s completion handler to flag that the expectation has been met.
             */
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
       /*
         Keeps the test running until all expectations are fulfilled or the timeout interval ends, whichever happens first
       */
      wait(for: [promise], timeout: 5)
    }
  
    func testSATScoreInfoApiCallGetsHTTPStatusCode200() throws {
      // given
      let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
      let url = URL(string: urlString)!
        
       /*
          Returns XCTestExpectation, stored in promise. description describes what you expect to happen.
       */
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = systemUnderTest.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
              
             /*
               Call this in the success condition closure of the asynchronous method’s completion handler to flag that the expectation has been met.
             */
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
       /*
         Keeps the test running until all expectations are fulfilled or the timeout interval ends, whichever happens first
       */
      wait(for: [promise], timeout: 5)
    }


}
