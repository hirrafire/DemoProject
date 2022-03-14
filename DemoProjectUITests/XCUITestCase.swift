//
//  XCUITestCase.swift
//  DemoProjectUITests
//
//  Created by Hira Saleem on 09/03/2022.
//

import XCTest
class XCUITestCase: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
    }
}
