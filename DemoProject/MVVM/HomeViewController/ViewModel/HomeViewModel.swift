//
//  HomeViewModel.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/03/2022.
//

import Foundation
import Combine

typealias Completion = () -> Void
class HomeViewModel {
    typealias Dependencies = UserDependencyInjection
    private let dependencies = Dependencies()
    var dataSource: [TableViewCellViewModel] = []
    var repository: UserRepository { return dependencies.userRepository }
    var didUpdateDataSource: Completion?
    @Published var didSelect : Results?
    @Published var result : [Results]?
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
        repository.getUser().receive(on: RunLoop.main).sink(receiveCompletion: {[weak self] complition in
            self?.showHud = false
            switch complition
            {
            case .failure(let error):
                self?.errorMessage = error
            case .finished:
                Print("Finished")
            }
        }, receiveValue: { [weak self] user in
            self?.result = user.results
            self?.prepareDataSource(with: self?.result ?? [])
            self?.didUpdateDataSource?()
        }).store(in: &subscriptions)
    }
    private func prepareDataSource(with results: [Results]) {
        dataSource.removeAll()
        
        results.forEach { result in
            let model = TableViewCellViewModel(result)
            dataSource.append(model)
        }
    }
    private func onDetail(_ representable: UserDataRepresentable) {
        guard let model = representable as? Results else { return }
        didSelect = model
    }
}
extension HomeViewModel{
    func onSelect(_ cellViewModel: TableViewCellViewModel?) {
        guard let model = cellViewModel?.model else { return }

        onDetail(model)
    }
}
