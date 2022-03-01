//
//  ActivityIndicator.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/3/2022.
//  Copyright © 2022 Hira Saleem. All rights reserved.
//

import Foundation
import Combine


public final class ActivityIndicator {
    private struct ActivityToken<Source: Publisher> {
        let source: Source
        let beginAction: () -> Void
        let finishAction: () -> Void
        
        func asPublisher() -> AnyPublisher<Source.Output, Source.Failure> {
            source.handleEvents(receiveCompletion: { _ in
                finishAction()
            }, receiveCancel: {
                finishAction()
            }, receiveRequest: { _ in
                beginAction()
            }).eraseToAnyPublisher()
            
        }
    }
    
    @Published
    private var relay = 0
    private let lock = NSRecursiveLock()
    
    public var loading: AnyPublisher<Bool, Never> {
        $relay.map { $0 > 0 }
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    public init() {}
    
    public func trackActivityOfPublisher<Source: Publisher>(source: Source) -> AnyPublisher<Source.Output, Source.Failure> {
        return ActivityToken(source: source) {
            self.increment()
        } finishAction: {
            self.decrement()
        }.asPublisher()

    }
    
    private func increment() {
        lock.lock()
        relay += 1
        lock.unlock()
    }
    
    private func decrement() {
        lock.lock()
        relay -= 1
        lock.unlock()
    }
}

extension Publisher {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> AnyPublisher<Self.Output, Self.Failure> {
        activityIndicator.trackActivityOfPublisher(source: self)
    }
}
