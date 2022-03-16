//
//  ArtistRepository.swift
//  DemoProject
//
//  Created by Hira Saleem on 16/03/2022.
//

import Foundation
import Combine
protocol ArtistRepository {
   
    func getArtist() -> Future<ArtistResponseModel,CustomError>
 
}
