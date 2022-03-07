//
//  Config.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/3/2022.
//
import Foundation
import UIKit


let API_VERSION = "/v" + api_version
let API_BASE_URL_Production = "API_BASE_URL_Production"
let API_BASE_URL_Staging = "https://randomuser.me/"
let API_SOCKET_URL = "API_CHAT_SOCKET_URL"
let API_User_URL = API_BASE_URL_Staging + "api?results=10"


// The domain used for creating all errors.
let domain = "com.LuckyBuy.DemoProject"

// Extra device and app info
let app_version = "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "")"
let app_build : String = Bundle.main.object(forInfoDictionaryKey:kCFBundleVersionKey as String) as! String
let device = UIDevice.current.model
let device_identifire = UIDevice.current.identifierForVendor!.uuidString
let os = "IOS"
let os_version = UIDevice.current.systemVersion
let app_name : String = Bundle.main.object(forInfoDictionaryKey:kCFBundleNameKey as String) as! String
let sdk_version = "1.0"
let api_version = "1"
let socket_version = "0.0.1"
let preferred_language = NSLocale.preferredLanguages.count > 0 ? NSLocale.preferredLanguages[0] : nil

// Api Endpoints

enum UserType: Int {
    case anonymous = 1
    case lead = 2
    case user = 4
}
