//
//  URLHelper.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

class URLHelper {
    static let shared = URLHelper()
    private let baseURL = ConfigurationManager.shared.infoForKey(.baseURL) ?? "https://"
    private let imageURL = ConfigurationManager.shared.infoForKey(.imageURL) ?? "https://"
    
    func getURLString(with url: String, version:String = "3") -> String {
        return baseURL + "/" + version + "/" + url
    }
    
    func getImageURL(with url: String) -> String {
        return imageURL + "/" + url
    }
}
