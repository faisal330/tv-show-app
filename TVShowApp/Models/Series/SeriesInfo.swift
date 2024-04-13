//
//  SeriesInfo.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

struct SeriesInfo : Codable {
	let adult : Bool?
	let backdrop_path : String?
	let created_by : [CreatedBy]?
	let episode_run_time : [Int]?
	let first_air_date : String?
	let genres : [Genres]?
	let homepage : String?
	let id : Int?
	let in_production : Bool?
	let languages : [String]?
	let last_air_date : String?
	let last_episode_to_air : Episode?
	let name : String?
	let networks : [Company]?
	let number_of_episodes : Int?
	let number_of_seasons : Int?
	let origin_country : [String]?
	let original_language : String?
	let original_name : String?
	let overview : String?
	let popularity : Double?
	let poster_path : String?
	let production_companies : [Company]?
	let production_countries : [Country]?
	let seasons : [Season]?
	let spoken_languages : [Languages]?
	let status : String?
	let tagline : String?
	let type : String?
	let vote_average : Double?
	let vote_count : Int?
    
    
}
