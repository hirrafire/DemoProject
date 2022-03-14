//
//  SubDetailPage.swift
//  DemoProjectUITests
//
//  Created by Hira Saleem on 09/03/2022.
//

import XCTest

final class SubDetailPage: Page {
    lazy var backToHomeButton = app.buttons["Back to home"].firstMatch

    required init(_ app: XCUIApplication) {
        super.init(app)
        
        waitFor( element: backToHomeButton, status: .hittable)
    }
    
    @discardableResult
    func backToHome() -> HomePage {
        tap(element: backToHomeButton)

        return HomePage(app)
    }
}
