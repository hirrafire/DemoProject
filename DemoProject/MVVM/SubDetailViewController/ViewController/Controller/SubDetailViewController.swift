//
//  SubDetailViewController.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit

class SubDetailViewController: BaseViewController {
    public weak var delegate: DetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SubDetailViewController"

        // Do any additional setup after loading the view.
    }
    @IBAction func navigateToHomePageAction(_ sender: Any) {
        self.delegate?.navigateToHomePage()
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
