//
//  SubDetailModel.swift
//  DemoProject
//
//  Created by Hira Saleem on 16/03/2022.
//

import Foundation
import Combine

class SubDetailModel {
    typealias Dependencies = UserDependencyInjection
    private let dependencies = Dependencies()
    var dataSource: [TableViewCellViewModel] = []
    var repository: ArtistRepository { return dependencies.artistRepository }
    var didUpdateDataSource: Completion?
    @Published var didSelect : ArtistResults?
    @Published var result : [ArtistResults]?
    @Published var errorMessage: CustomError? = nil
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var showHud = false
    init() {
        showHud = true
        
    }
    
    func fetchUser() {
        if !showHud{
            showHud = true
        }
        repository.getArtist().receive(on: RunLoop.main).sink(receiveCompletion: {[weak self] complition in
            self?.showHud = false
            switch complition
            {
            case .failure(let error):
                self?.errorMessage = error
            case .finished:
                Print("Finished")
            }
        }, receiveValue: { [weak self] artist in
            self?.result = artist.results
            self?.prepareDataSource(with: self?.result ?? [])
            self?.didUpdateDataSource?()
        }).store(in: &subscriptions)
    }
    private func prepareDataSource(with results: [ArtistResults]) {
        dataSource.removeAll()
        
        results.forEach { result in
            let model = TableViewCellViewModel(result)
            dataSource.append(model)
        }
    }
   
}

