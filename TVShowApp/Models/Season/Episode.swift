//
//  Episode.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import Foundation

struct Episode : Codable {
    let id : Int?
    let name : String?
    let overview : String?
    let vote_average : Double?
    let vote_count : Int?
    let air_date : String?
    let episode_number : Int?
    let episode_type : String?
    let production_code : String?
    let runtime : Int?
    let season_number : Int?
    let show_id : Int?
    let still_path : String?
    let crew : [Crew]?
    let guest_stars : [Crew]?
}
