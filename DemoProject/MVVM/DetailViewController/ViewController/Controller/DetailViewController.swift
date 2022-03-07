//
//  DetailViewController.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func navigateToHomePage()
    func navigateToSubDetailPage()
}
class DetailViewController: BaseViewController {
    public weak var delegate: DetailViewControllerDelegate?
    @IBOutlet weak var customView: DetailView!
    var modal: UserDataRepresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DetailViewController"
        
        // Use custom back button to pass through coordinator.
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(navigateBackToHomepage))
        self.navigationItem.leftBarButtonItem = backButton
        // Do any additional setup after loading the view.
    }
    override func configureView() {
        self.customView.userImage.layer.cornerRadius =   self.customView.userImage.frame.height
        if let modal  = self.modal{
            let location = modal.location

            self.customView.titleNameLabel.text = "Title: \(modal.name.title ?? "")"
            self.customView.firstNameLabel.text = "First Name: \(modal.name.first ?? "")"
            self.customView.secondNameLabel.text = "Last Name: \(modal.name.last ?? "")"
            self.customView.genderLabel.text = "Gender: \(modal.gender ?? "")"
            
            self.customView.streetLabel.text = "Street: \(location?.street?.number ?? 0) \(location?.street?.name ?? "")"
            self.customView.cityLabel.text = "City: \(location?.city ?? "")"
            self.customView.stateLabel.text = "State: \(location?.state ?? "")"
            self.customView.countryLabel.text = "Country: \(location?.country ?? "")"
            self.customView.postCodeLabel.text = "Post Code: \(location?.postcode ?? "0")"


            self.customView.emailLabel.text = "Email: \(modal.email ?? "")"
            self.customView.dobLabel.text = "Date of Birth: \(modal.dob.date ?? "")"
            self.customView.cellNumberLabel.text = "Cell Number: \(modal.cell ?? "")"
            self.customView.landlineNumberLabel.text = "Phone Number: \(modal.phone ?? "")"
            self.customView.ageLabel.text = "Age: \(modal.dob.age ?? 100)"
            
            self.customView.userImage.setImage(modal.picture?.large ?? "")
         
        }
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
