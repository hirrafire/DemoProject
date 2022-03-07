//
//  Coordinator.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit

public protocol Coordinator : AnyObject {

    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)

    func start()
}
