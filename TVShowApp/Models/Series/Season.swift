//
//  Season.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import Foundation

struct Season : Codable {
    let id : Int?
    let air_date : String?
    let episodes : [Episode]?
    let name : String?
    let overview : String?
    let poster_path : String?
    let season_number : Int?
    let vote_average : Double?
    var isSelected: Bool? = false
}
