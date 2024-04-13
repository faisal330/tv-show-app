//
//  SeasonInfo.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

struct SeasonInfo : Codable {
    let id : Int?
    let air_date : String?
    let episodes : [Episode]?
    let name : String?
    let overview : String?
    let poster_path : String?
    let season_number : Int?
    let vote_average : Double?
}
