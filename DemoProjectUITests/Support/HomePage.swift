//
//  HomePage.swift
//  DemoProjectUITests
//
//  Created by Hira Saleem on 09/03/2022.
//

import XCTest

final class HomePage: Page {
  

    lazy var title = app.navigationBars["HomeViewController"].firstMatch
    lazy var users = app.tables.cells.firstMatch

    required init(_ app: XCUIApplication) {
        super.init(app)
        
        waitFor( element: title, status: .exist)
    }
    
   
    @discardableResult
    func click() -> Self {
        tap(element: users)
        
        return self
    }
   
}
