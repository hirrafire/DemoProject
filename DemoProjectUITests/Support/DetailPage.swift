//
//  DetailPage.swift
//  DemoProjectUITests
//
//  Created by Hira Saleem on 09/03/2022.
//

import XCTest

final class DetailPage: Page {
    lazy var continueButton = app.buttons["Continue"].firstMatch
    lazy var title = app.navigationBars["DetailViewController"].firstMatch

    required init(_ app: XCUIApplication) {
        super.init(app)
        
        waitFor(element: title, status: .exist)
    }
    
 
   
    
    @discardableResult
    func contuneToSubDetail() -> SubDetailPage {
        tapButton(element: continueButton, status: .exist)

        return SubDetailPage(app)
    }
}

