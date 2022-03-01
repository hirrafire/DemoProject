//
//  LocalizeHelper.swift
//  DemoProject
//
//  Created by Hira Saleem on 01/3/2022.
//
import Foundation
import UIKit

let bundleIdentifier = "com.LuckyBuy.DemoProject"

class LocalizeHelper: NSObject {

    private var myBundle: Bundle? = nil

    static let shared: LocalizeHelper = {
        let instance = LocalizeHelper()
        return instance
    }()

    override init() {
        super.init()
        // use systems main bundle as default bundle
        myBundle = Bundle(identifier: bundleIdentifier)

    }

    func localizedString(forKey key: String) -> String {
        Print(myBundle?.localizedString(forKey: key, value: "", table: nil) as Any)
        return myBundle?.localizedString(forKey: key, value: "", table: nil) ?? ""
    }

    //  Converted with Swiftify v1.0.6331 - https://objectivec2swift.com/
    func setLanguage(_ lang: String) {
        // path to this languages bundle
        let bundle = Bundle(identifier: bundleIdentifier)
        
        var path: String? = bundle?.path(forResource: lang, ofType: "lproj")
        
        switch lang.lowercased() {
        case "zh":
            path = bundle?.path(forResource: lang + "-HK", ofType: "lproj")
            
        case "pt":
            path = bundle?.path(forResource: lang + "-PT", ofType: "lproj")
            
        default:
            path  = bundle?.path(forResource: lang, ofType: "lproj")
        }
        if path == nil {
            // there is no bundle for that language
            // use main bundle instead
            myBundle = bundle
        }
        else {
            // use this bundle as my bundle from now on:
            myBundle = Bundle(path: path ?? "" )
            // to be absolutely shure (this is probably unnecessary):
            if myBundle == nil {
                myBundle = bundle
            }
        }
    }

    func getLanguage() -> String {
        Print("\(String(describing: myBundle?.bundlePath.last))")
        //return myBundle!.bundlePath.last >> Error
        return String(myBundle!.bundleURL.lastPathComponent.split(separator: ".", maxSplits: 1, omittingEmptySubsequences: true).first ?? "en_US")
    }
}

extension String {
    public var lastCharacter: String? {
        guard let aLast = self.last else {
            return nil
        }
        return String(aLast)
    }
}
