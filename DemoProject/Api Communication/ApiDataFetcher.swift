//
//  ApiDataFetcher.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/3/2022.
//

import UIKit
import Combine
import Foundation
import CoreServices


class ApiDataFetcher: NSObject {
    
    var session: URLSession
    var cancelable  =  Set<AnyCancellable>()
    
    //MARK: Singleton
    static let sharedInstance = ApiDataFetcher(managerCachePolicy: .reloadIgnoringLocalCacheData)
    
    //MARK: Init
    override init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
        super.init()
        
    }
    
    init(managerCachePolicy:NSURLRequest.CachePolicy){
        self.session = URLSession(configuration: URLSessionConfiguration.default)
        super.init()
        self.configure(cachePolicy: managerCachePolicy)
    }
    
    //MARK: Session Configuration
    func configure(cachePolicy:NSURLRequest.CachePolicy?){
        let sessionConfiguration = URLSessionConfiguration.default //URLSessionConfiguration()
        sessionConfiguration.timeoutIntervalForRequest = 10.0
        sessionConfiguration.requestCachePolicy = cachePolicy != nil ? cachePolicy! : .reloadIgnoringLocalCacheData
        sessionConfiguration.httpAdditionalHeaders = ["Accept-Language": preferred_language ?? "en"]
        
        self.session = URLSession(configuration: sessionConfiguration)
    }
//    
//    func getGithubUserRequest() -> Future<[GithubUser],CustomError>{
//        
//        return Future<[GithubUser],CustomError> { [weak self] promise in
//            var urlRequest =  Routing.GetGithubUser(nil).urlRequest
//            Print("Request URL : \(urlRequest.url?.absoluteString ?? "")")
//            urlRequest.httpMethod = "GET"
//            self?.session.dataTaskPublisher(for: urlRequest)
//                .tryMap{ (data, response) -> Data in
//                    guard response.validate() == nil else{
//                        do{
//                            let responseData = response as! HTTPURLResponse
//                            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
//                            if let errorObject = json?["response"] as? [String : Any]{
//                                let error  = CustomError(title: "", description: errorObject["message"] as! String, code: responseData.statusCode)
//                                promise(.failure(error))
//                            }
//                        }catch{ print("erroMsg") }
//                        throw (response.validate() ?? NetworkError.unknownError)
//                    }
//                    
//                    return data
//                } .decode(type: GithubUser.self, decoder: JSONDecoder())
//                .sink(receiveCompletion: { completion in
//                    if case let .failure(error) = completion{
//                        switch error {
//                        case _ as DecodingError:
//                            let error  = CustomError(title: "", description: LocalizeHelper.shared.localizedString(forKey: "DecodingError"), code: 0)
//                            promise(.failure(error))
//                        default :
//                            let error  = CustomError(title: "", description: LocalizeHelper.shared.localizedString(forKey: "UnknownError"), code: 0)
//                            promise(.failure(error))
//                        }
//                    }
//                },
//                      receiveValue:{
//                    promise(.success($0!))
//                })
//                .store(in: &self!.cancelable)
//            
//        }
//        
        
//    }
    
}
