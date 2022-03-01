//
//  NavigationViewController.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/03/2022.
//

import UIKit

class NavigationViewController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyNavBarCustomization()
        applySwipeGesture()
        self.modalPresentationStyle = .fullScreen
        // Always adopt a light interface style.
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.interactivePopGestureRecognizer?.isEnabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Customizations
    func applyNavBarCustomization(){
        
        self.navigationBar.barTintColor = UIColor.white //background color navbar
        self.navigationBar.tintColor = UIColor.white //tint color elements on navbar
        self.navigationBar.backgroundColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    //enable "swipe left to right" gesture to navigate to the previous controller when the back button is custom
    func applySwipeGesture(){
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)){
            self.interactivePopGestureRecognizer?.isEnabled = true
            self.interactivePopGestureRecognizer?.delegate = self
        }
    }
    
}


