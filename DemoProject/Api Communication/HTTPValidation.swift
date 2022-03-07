//
//  HTTPValidation.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import Foundation

extension URLResponse{
    
    //Return error if the status code is not inside 200-299 range.
    func validate() -> NetworkError?{
        let acceptableStatusCodes: Range<Int> = 200..<300
        
        let response = self as! HTTPURLResponse
    
        if !acceptableStatusCodes.contains(response.statusCode){
            
            return NetworkError.checkErrorCode(response.statusCode)
        }
        
        return nil
    }
}
extension  Error {
    
    var errorCode:Int? {
        return (self as NSError).code
    }
    func validate() -> NetworkError?{
        let acceptableStatusCodes: Range<Int> = 200..<300
        
        let code = self.errorCode
    
        if !acceptableStatusCodes.contains(code ?? 0){
            
            return NetworkError.checkErrorCode(code ?? 0)
        }
        
        return nil
    }
}
