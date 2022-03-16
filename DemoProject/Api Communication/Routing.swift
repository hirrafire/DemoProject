//
//  Routing.swift
//  ocss-ios-chatsdk
//
//  Created by Hira Saleem on 03/03/2022.
//
import UIKit

enum Routing{
    
    case getUser([String: Any]?)
    case getArtist([String: Any]?)

    var urlRequest: URLRequest{
        
        let touple : (path: String, parameters: [String: Any]?) = {
            switch self{
            case .getUser(let params):
                return(API_User_URL, params)
            case .getArtist(let params):
                return(API_Artist_URL, params)
            }
        }()
        
        let url:URL = URL(string: touple.path)!
        var urlRequest = URLRequest(url:url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        if let param = touple.parameters
        {
            urlRequest.httpBody = Routing.createDataFromJSONDictionary(dataToSend:param)
        }
        
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


