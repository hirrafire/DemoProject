//
//  DetailViewCoordinator.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit
protocol BackToHomeViewControllerDelegate: AnyObject {
    
    func navigateBackToHomePage(newOrderCoordinator: DetailViewCoordinator)
    
}

class DetailViewCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: BackToHomeViewControllerDelegate?
    var modal: Results?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController : DetailViewController = DetailViewController()
        detailViewController.delegate = self
        detailViewController.result = modal
        self.navigationController.pushViewController(detailViewController, animated: true)
    }
}

extension DetailViewCoordinator : DetailViewControllerDelegate {
    
    // Navigate to third page
    func navigateToSubDetailPage() {
        let thirdViewController : SubDetailViewController = SubDetailViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    // Navigate to first page
    func navigateToHomePage() {
        self.delegate?.navigateBackToHomePage(newOrderCoordinator: self)
    }
}
