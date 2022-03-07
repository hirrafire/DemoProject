//
//  UIImageView+Extension.swift
//  DemoProject
//
//  Created by Hira Saleem on 07/03/2022.
//

import UIKit
extension UIImageView{
    func setImage(_ url : String){
        // Create URL
        let url = URL(string: url)!

        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.image = UIImage(data: data) ?? UIImage()
                }
            }
        }
    }
}
