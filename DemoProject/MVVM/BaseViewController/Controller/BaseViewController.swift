//
//  BaseViewController.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/03/2022.
//

import UIKit

class BaseViewController: UIViewController {
    func titleView(string: String) {
        let labelTitle = UILabel()
        labelTitle.text = string
        labelTitle.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = labelTitle
    }
    /// Adding the left navigation bar item
    /// - image :
    /// the image that we want to show in the navigation item
    func leftBarButton(image: UIImage? = nil, backgroundColor: UIColor = UIColor.gray) {
        let leftButton =  UIButton(frame: CGRect(origin: .zero, size: CGSize(width:  38, height:  38)))
        leftButton.setImage(image, for: .normal)
        leftButton.backgroundColor = backgroundColor
        let barButton = UIBarButtonItem(customView: leftButton)
        leftButton.addTarget(self, action: #selector(actionBackButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = barButton
    }
    
   @objc func actionBackButton(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func actionRightButton(sender: UIButton) {
     }
     
    
    /// Adding the right navigation bar item
    /// - image :
    /// the image that we want to show in the navigation item
    @objc func rightBarButton(image: UIImage? = nil) {
        let rightButton =  UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
        rightButton.setImage(image, for: .normal)
        rightButton.addTarget(self, action: #selector(actionRightButton(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItems = [barButton]
    }
}
