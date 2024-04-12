//
//  ConfigurationManager.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

class ConfigurationManager: NSObject {
    
    static var shared = ConfigurationManager()
    private override init() { }
    
    func infoForKey(_ key: ConfigurationKey) -> String? {
        return (Bundle.main.infoDictionary?[key.rawValue] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}

enum ConfigurationKey: String {
    case baseURL = "baseURL"
    case tmdbAPI = "tmdbAPI"
}
