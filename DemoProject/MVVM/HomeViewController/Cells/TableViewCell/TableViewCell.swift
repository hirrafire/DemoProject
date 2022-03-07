//
//  TableViewCell.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    // MARK: - Properties
    private var viewModel: TableViewCellViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImage.layer.cornerRadius  =  self.userImage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepare(with viewModel: TableViewCellViewModel) {
     
        self.nameLabel.text =  viewModel.name
        self.locationLabel.text = viewModel.address
        self.userImage.setImage(viewModel.imageUrl )
    }
    
}

