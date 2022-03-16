//
//  UserDataRepresentable.swift
//  DemoProject
//
//  Created by Hira Saleem on 04/03/2022.
//

import Foundation

protocol UserDataRepresentable {

    var gender: String! { get }
    var name: Name! { get }
    var location: Location! { get }
    var email: String! { get }
    var login: Login! { get }
    var dob: Dob! { get }
    var registered: Registered! { get }
    var phone: String! { get }
    var cell: String! { get }
    var id: Id! { get }
    var nat: String! { get }
    var streetName: String! { get }
    var firstName: String! { get }
    var userPicture: String! { get }

}
