//
//  Storyboarded.swift
//  Unibuy
//
//  Created by Hira Saleem on 01/03/2022.
//  Copyright © 2022 Hira Saleem. All rights reserved.
//

import UIKit

public enum Storyboard : String {
    case main = "Main"
  
}

protocol Storyboarded {
    static func instantiate(_ storyboard: UIStoryboard) -> Self
    
    static func instantiate(_ storyboard: Storyboard) -> Self
    static func instantiateInitial(_ storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(_ storyboard: UIStoryboard) -> Self {
        // this pulls out "Application.ViewController"
        let className = String(describing: self)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
    static func instantiate(_ storyboard: Storyboard = .main) -> Self {
        // this pulls out "Application.ViewController"
        let className = String(describing: self)
        
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
    static func instantiateInitial(_ storyboard: Storyboard = .main) -> Self {
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        
        // instantiate initial view controller, and force cast as the type that was requested
        return storyboard.instantiateInitialViewController() as! Self
    }
}

/// Initial Controller is UINavigationController

extension UINavigationController: Storyboarded {
    
}
