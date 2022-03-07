//
//  RequestUserRepositories.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/03/2022.
//

import Foundation
import Combine
enum RepositoryError: Error {
    case notFound
}
final class  RequestUserRepositories :NSObject ,UserRepository {
    
    var session : URLSession
    var cancelable  =  Set<AnyCancellable>()
    override init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
        super.init()
        
    }
    func get() -> Future<Users,CustomError>{
        
        return Future<Users,CustomError> { [weak self] promise in
            var urlRequest =  Routing.getUser(nil).urlRequest
            Print("Request URL : \(urlRequest.url?.absoluteString ?? "")")
            urlRequest.httpMethod = "GET"
            self?.session.dataTaskPublisher(for: urlRequest)
                .tryMap{ (data, response) -> Data in
                    guard response.validate() == nil else{
                        do{
                            let responseData = response as! HTTPURLResponse
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                            if let errorObject = json?["response"] as? [String : Any]{
                                let error  = CustomError(title: "", description: errorObject["message"] as! String, code: responseData.statusCode)
                                promise(.failure(error))
                            }
                        }catch{ print("erroMsg") }
                        throw (response.validate() ?? NetworkError.unknownError)
                    }
                    
                    return data
                } .decode(type: Users.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion{
                        switch error {
                        case _ as DecodingError:
                            let error  = CustomError(title: "", description: LocalizeHelper.shared.localizedString(forKey: "DecodingError"), code: 0)
                            promise(.failure(error))
                        default :
                            let error  = CustomError(title: "", description: LocalizeHelper.shared.localizedString(forKey: "UnknownError"), code: 0)
                            promise(.failure(error))
                        }
                    }
                },
                      receiveValue:{
                    promise(.success($0))
                })
                .store(in: &self!.cancelable)
            
        }
    }
    

}
