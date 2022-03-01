//
//  HomeViewModel.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/03/2022.
//

import Foundation
import Combine

final class HomeViewModel : ObservableObject {

    @Published var githubUser: GithubUser?
    @Published var isLoading: Bool = false
    @Published var error: Error?
    private let userName: String = ""
//    private let githubUserRepository = GithubUserRepository()
//    private var cancellableSet = Set<AnyCancellable>()
//
//    init(userName: String) {
//        self.userName = userName
//    }
//
//    func initialize() {
//        cancellableSet.removeAll()
//        subscribe()
//    }
//
//    func refresh() {
//        githubUserRepository.refresh(userName: userName)
//            .receive(on: DispatchQueue.main)
//            .sink {}
//            .store(in: &cancellableSet)
//    }
//
//    func retry() {
//        githubUserRepository.refresh(userName: userName)
//            .receive(on: DispatchQueue.main)
//            .sink {}
//            .store(in: &cancellableSet)
//    }
//
//    private func subscribe() {
//        githubUserRepository.follow(userName: userName)
//            .receive(on: DispatchQueue.main)
//            .sink { state in
//                state.doAction(
//                    onLoading: { _ in
//                        self.githubUser = nil
//                        self.isLoading = true
//                        self.error = nil
//                    },
//                    onCompleted: { githubUser, _, _ in
//                        self.githubUser = githubUser
//                        self.isLoading = false
//                        self.error = nil
//                    },
//                    onError: { error in
//                        self.githubUser = nil
//                        self.isLoading = false
//                        self.error = error
//                    }
//                )
//            }
//            .store(in: &cancellableSet)
//    }
}
