//
//  DetailView.swift
//  DemoProject
//
//  Created by Hira Saleem on 04/03/2022.
//

import UIKit

class DetailView: UIView {
    public var didReceiveSenderCallback: ((_ sender: UIButton) -> Void)?
    // Full name
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    // Gender
    @IBOutlet weak var genderLabel: UILabel!
    // Address
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var postCodeLabel: UILabel!
    // Email
    @IBOutlet weak var emailLabel: UILabel!
    // Date of birth
    @IBOutlet weak var dobLabel: UILabel!
    // Phone Number
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var landlineNumberLabel: UILabel!
    // Button
    
    @IBOutlet weak var continueButton: UIButton!
    
    
    @IBAction func continueAction(_ sender: UIButton) {
        if let callBack = self.didReceiveSenderCallback {
            callBack(sender)
        }
    }
    
    /*
     @IBOutlet weak var cellNumberLabel: UILabel!
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
