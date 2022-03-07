//
//  AppDependency.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/03/2022.
//


import UIKit


protocol HasUserRepository {
    var userRepository: UserRepository { get }
}
class UserDependencyInjection: HasUserRepository {
 
    let userRepository: UserRepository

    init(){
        self.userRepository = RequestUserRepositories()
    }
}

