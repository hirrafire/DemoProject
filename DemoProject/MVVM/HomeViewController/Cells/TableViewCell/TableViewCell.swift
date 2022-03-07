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
    // MARK: - Properties
    private var viewModel: TableViewCellViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepare(with viewModel: TableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text =  viewModel.name
        locationLabel.text = viewModel.address
    }
}
