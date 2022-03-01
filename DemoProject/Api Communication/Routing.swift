//
//  OCSSRouting.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/3/2022.
//
import UIKit

enum Routing{
    
    case Ping([String: Any]?)
    case GetGithubUser([String: Any]?)


    var urlRequest: URLRequest{
        
        let touple : (path: String, parameters: [String: Any]?) = {
            switch self{
            case .Ping(let params):
                return(API_User_URL + "/ping", params)
            case .GetGithubUser(let params):
                return(API_User_URL + "/users", params)

            }
        }()
        
        let url:URL = URL(string: touple.path)!
        var urlRequest = URLRequest(url:url)
        if let param = touple.parameters
        {
            urlRequest.httpBody = Routing.createDataFromJSONDictionary(dataToSend:param)
        }
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("ios", forHTTPHeaderField: "OCSSChat-sdk")
        urlRequest.addValue(sdk_version, forHTTPHeaderField: "OCSSChat-sdk-version")

        urlRequest.addValue(device_identifire, forHTTPHeaderField: "deviceId")
       // urlRequest.addValue("OCSSTNT0001", forHTTPHeaderField: "tenantId")
        urlRequest.addValue("TNT2112", forHTTPHeaderField: "tenantId")
        
        urlRequest.addValue("android", forHTTPHeaderField: "osType")

        urlRequest.timeoutInterval = 100


        
        return urlRequest
    }
    static func createDataFromJSONDictionary(dataToSend: [String:Any]?) -> Data?{
        
        guard dataToSend != nil else{
            return nil
        }
        do{
            if JSONSerialization.isValidJSONObject(dataToSend! as NSDictionary){
                
                let json = try JSONSerialization.data(withJSONObject: dataToSend! as NSDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
                let data_string = String(data: json, encoding: String.Encoding.utf8)
                
                return data_string?.data(using: String.Encoding.utf8)
            }
        }
        catch{
            Print("Error! Could not create JSON for server payload.")
            return nil
        }
        
        return nil
    }
}


extension URL {
    func toUrlRequest() -> URLRequest {
        URLRequest(url: self, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
    }
}
