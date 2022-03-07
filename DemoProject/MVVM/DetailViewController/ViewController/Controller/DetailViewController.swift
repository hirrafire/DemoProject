//
//  DetailViewController.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit

public protocol DetailViewControllerDelegate: AnyObject {
    func navigateToHomePage()
    func navigateToSubDetailPage()
}
class DetailViewController: BaseViewController {
    public weak var delegate: DetailViewControllerDelegate?
    @IBOutlet weak var customView: DetailView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DetailViewController"
        
        // Use custom back button to pass through coordinator.
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(navigateBackToHomepage))
        self.navigationItem.leftBarButtonItem = backButton
        // Do any additional setup after loading the view.
    }
    override func configureView() {
        
    }
    override func configureCallBacks() {
        weak var weakSelf = self
        self.customView.didReceiveSenderCallback = {indexPath in
            weakSelf?.handleRowTappedEvent(sender: indexPath)
        }
    }
    @objc func navigateBackToHomepage() {
        self.delegate?.navigateToHomePage()
    }
    
   
    func handleRowTappedEvent(sender: UIButton) {
        self.delegate?.navigateToSubDetailPage()
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
