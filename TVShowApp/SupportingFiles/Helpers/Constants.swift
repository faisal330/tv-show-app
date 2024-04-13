//
//  Constants.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation
class Constants: NSObject {
    private override init() { }
    
    //MARK: API ERRORS
    static let Error = "Error"
    static let SomethingWentWrong = "Something went wrong"
    static let unAuthorized = "Invalid credentials"
    static let notFound = "Resource not found"
    static let badReponse = "Bad Response"
    
    //MARK: FORMATTERS
    static let UTC = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let yyyy_MM_dd = "yyyy-MM-dd"
    static let yyyy = "yyyy"
}
