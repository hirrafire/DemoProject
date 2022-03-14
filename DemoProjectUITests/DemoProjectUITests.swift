//
//  DemoProjectUITests.swift
//  DemoProjectUITests
//
//  Created by Hira Saleem on 01/03/2022.
//

import XCTest

class DemoProjectUITests: XCTestCase {
    var demoProjectTracker: Page!
    var app = XCUIApplication()

    override func setUp() {
        super.setUp()
        demoProjectTracker = TestBuilder(app).setLocale().launch()
        continueAfterFailure = false
        app = XCUIApplication()
        sleep(1)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
   
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    func testClick() {

        demoProjectTracker
            .on(page: HomePage.self).click().on(page: DetailPage.self).contuneToSubDetail().on(page: SubDetailPage.self).backToHome()
           
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
