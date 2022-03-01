//
//  Enum.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/3/2022.
//

import Foundation

enum SERVER_MODE
{
    case development
    case staging
    case production
};


enum Request_Status
{
    case Consideration
    case Inprogress
    case Rejected
    case Completed
};

enum Request_Date
{
    case Today
    case Tomorrow
    case ThisWeek
};

enum NetworkError: Error, LocalizedError, CustomNSError {
    
    case badRequest
    case unAuthorized
    case forbidden
    case notFound
    case methodNotAllowed
    case serverError
    case noConnection
    case timeOutError
    case unknownError
    case decodingError
    
    var errorDescription: String? {
        
        switch self {
            
        case .badRequest:
            return LocalizeHelper.shared.localizedString(forKey: "NetworkBadRequest")
        case .unAuthorized:
            return LocalizeHelper.shared.localizedString(forKey: "UnAuthorized")
        case .forbidden:
            return LocalizeHelper.shared.localizedString(forKey: "Forbidden")
        case .notFound:
            return LocalizeHelper.shared.localizedString(forKey: "NotFound")
        case .methodNotAllowed:
            return LocalizeHelper.shared.localizedString(forKey: "MethodNotAllowed")
        case .serverError:
            return LocalizeHelper.shared.localizedString(forKey: "ServerError")
        case .noConnection:
            return LocalizeHelper.shared.localizedString(forKey: "NoConection")
        case .timeOutError:
            return LocalizeHelper.shared.localizedString(forKey: "TimeOutError")
        case .unknownError:
            return LocalizeHelper.shared.localizedString(forKey: "UnknownError")
        case .decodingError:
            return LocalizeHelper.shared.localizedString(forKey: "DecodingError")
        
        }
    }
    static func checkErrorCode(_ errorCode: Int) -> NetworkError {
            switch errorCode {
            case 400:
                return .badRequest
            case 401:
                return .unAuthorized
            case 403:
                return .forbidden
            case 404:
                return .notFound
            case 405:
                return .methodNotAllowed
            case 500:
                return .serverError
            case -1009:
                return .noConnection
            case -1001:
                return .timeOutError
            default:
                return .unknownError
            }
        }

}
protocol OurErrorProtocol: LocalizedError {
    
    var title: String? { get }
    var code: Int { get }
}
struct CustomError: OurErrorProtocol {
    
    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    
    private var _description: String
    
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}
