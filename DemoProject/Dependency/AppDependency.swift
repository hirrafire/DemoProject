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
protocol HasArtistRepository {
    var userRepository: UserRepository { get }
}
class UserDependencyInjection: HasUserRepository,HasArtistRepository {
 
    let userRepository: UserRepository
    let artistRepository: ArtistRepository

    init(){
        self.userRepository = RequestUserRepositories()

        self.artistRepository = RequestArtistRepositories()
    }
}

