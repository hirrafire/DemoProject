//
//  UserRepository.swift
//  Example
//
//  Created by Kensuke Tamura on 2020/12/21.
//

import Foundation
import Combine
protocol UserRepository {
   
    func get() -> Future<Users,CustomError>
 
}
