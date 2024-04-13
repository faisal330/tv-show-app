//
//  APIError.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

struct APIError : Codable {
    let success : Bool?
    let status_code : Int?
    let status_message : String?
}
