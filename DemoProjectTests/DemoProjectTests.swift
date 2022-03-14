//
//  DemoProjectTests.swift
//  DemoProjectTests
//
//  Created by Hira Saleem on 01/03/2022.
//

import XCTest
@testable import DemoProject

class DemoProjectTests: XCTestCase {
    var sut: URLSession!
    let networkMonitor = NetworkMonitor.shared
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = URLSession(configuration: .default)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    func testValidApiCallGetsHTTPStatusCode200() throws {
      try XCTSkipUnless(
        networkMonitor.isReachable,
        "Network connectivity test")

      // given
      let urlString = API_User_URL
      let url = URL(string: urlString)!
      let promise = expectation(description: "Status : Ok")
      let dataTask = sut.dataTask(with: url) { _, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
