//
//  HomeViewCoordinator.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//


import UIKit

class HomeViewCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController : HomeViewController = HomeViewController()
        firstViewController.delegate = self
        self.navigationController.viewControllers = [firstViewController]
    }
}

extension HomeViewCoordinator: HomeViewControllerDelegate {

    // Navigate to next page
    func navigateToNextPage(_ result: Results) {
       let detailCoordinator = DetailViewCoordinator(navigationController: navigationController)
        detailCoordinator.delegate = self
        detailCoordinator.modal = result
       childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}

extension HomeViewCoordinator: BackToHomeViewControllerDelegate {
    
    // Back from third page
    func navigateBackToHomePage(newOrderCoordinator: DetailViewCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}


