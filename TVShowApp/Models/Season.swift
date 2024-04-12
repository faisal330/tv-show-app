//
//  Season.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import Foundation

struct Season : Codable {
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
    var isSelected: Bool? = false
    
    
    
    static func getDummyData() -> [Season] {
        var data = [Season]()
        data.append(Season(air_date: "2016-05-15",
                           episode_number: 1,
                           episode_type: "standard",
                           id: 3225765,
                           name: "About Billions",
                           overview: "Paul Giamatti and Damian Lewis take you inside the new Showtime original series about two titanic figures on a collision course in the high stakes world of New York finance: Billions.",
                           production_code: "",
                           runtime: 60,
                           season_number: 0,
                           show_id: 62852,
                           still_path: nil,
                           vote_average: 0,
                           vote_count: 0,
                           crew: [],
                           guest_stars: []))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 2,
            episode_type: "standard",
            id: 2659645,
            name: "Street Slang",
            overview: "A discussion of the extra details of the different and relatable dialogue and vocabulary to the law and finance worlds, so you can understand what certain words mean.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/nnG1SAWB4j6sqy0kcXNULwilMIL.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 3,
            episode_type: "standard",
            id: 2659647,
            name: "Profile Axe",
            overview: "A look at Hedgefund manager Bobby Axelrod, the alpha male, first generation billionaire with real money.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/u3LHLPjAaG065S09A3XRHz00CwJ.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 4,
            episode_type: "standard",
            id: 2659648,
            name: "Profile Chuck",
            overview: "A look at Chuck Rhoades the US attorney for the Southern District of New York which includes Manhattan and Wall Street and is one of the most powerful law enforcement positions in America.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/sZM8fAsbjy37Q6MuJcGtY94080i.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 5,
            episode_type: "standard",
            id: 2659649,
            name: "Profile Wendy",
            overview: "A look at Wendy Rhoades the in house performance coach at Axe Capital where she is swimming with the sharks.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/ePiazJtUIWaWurZK7m06HEbhp9D.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 6,
            episode_type: "standard",
            id: 2659650,
            name: "Profile Lara",
            overview: "A look at Lara Axelrod who comes from a working class family married to Bobby Axelrod.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/wekWOUhYA6S0WPz9eqNWcZLs9G6.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 7,
            episode_type: "standard",
            id: 2659651,
            name: "Location: New York",
            overview: "The important role New York City plays in the show as not just a setting, but a character in it. It also looks at the importance of food in the show and set design.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/waR9vrHaJHIdurn2ejmb0YWRjBk.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 8,
            episode_type: "standard",
            id: 2659652,
            name: "Character Development",
            overview: "A look at the show's central conflicts, the layered characters, their backgrounds, and their core interactions.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/5mQPutO5mTdzIp2CZTyMJ2CxRcL.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
        data.append(Season(
            air_date: "2016-11-08",
            episode_number: 9,
            episode_type: "standard",
            id: 2659653,
            name: "Shadows and Light",
            overview: "A closer look at the contrasts within the show's characters and the gray areas in between. It also looks at how the production accentuates or contrasts them throughout the season.",
            production_code: "",
            runtime: 60,
            season_number: 0,
            show_id: 62852,
            still_path: "/7unATspPh7MsBamUcJHQ0iDb3dX.jpg",
            vote_average: 0,
            vote_count: 0,
            crew: [],
            guest_stars: []
        ))
        
    return data
    }
        
    
    
}
