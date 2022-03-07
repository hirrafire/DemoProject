//
//  TableViewCellViewModel.swift
//  DemoProject
//
//  Created by Hira Saleem on 04/03/2022.
//

import Foundation
import UIKit
class TableViewCellViewModel {
    
    // MARK: - Properties
    var model: UserDataRepresentable!
    var name: String{ model.name.first}
    var address: String { model.location.street.name}

    init(_ model: UserDataRepresentable) {
        self.model = model
    }
}


extension TableViewCellViewModel: Hashable {
    
    static func == (lhs: TableViewCellViewModel, rhs: TableViewCellViewModel) -> Bool {
        return lhs.model.id == rhs.model.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(model.id)
    }
}
