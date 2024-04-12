//
//  Episode.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import Foundation

struct Episode : Codable {
    let air_date : String?
    let episode_number : Int?
    let episode_type : String?
    let id : Int?
    let name : String?
    let overview : String?
    let production_code : String?
    let runtime : Int?
    let season_number : Int?
    let show_id : Int?
    let still_path : String?
    let vote_average : Int?
    let vote_count : Int?
    let crew : [String]?
    let guest_stars : [String]?
    
}
