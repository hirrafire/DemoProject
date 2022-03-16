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
    var name: String{ model.firstName ?? ""}
    var address: String { model.streetName ?? ""}
    var imageUrl: String { model.userPicture ?? ""}

    init(_ model: UserDataRepresentable) {
        self.model = model
    }
}


extension TableViewCellViewModel: Hashable {
    
    static func == (lhs: TableViewCellViewModel, rhs: TableViewCellViewModel) -> Bool {
        return lhs.model.id.name == rhs.model.id.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(model.id.name)
    }
}
