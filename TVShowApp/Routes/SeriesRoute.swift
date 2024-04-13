//
//  SeriesRoute.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

extension URI {
    enum Series: String {
        case getDetail = "tv/SERIES_ID"
        case getSeasonDetail = "tv/SERIES_ID/season/SEASON_NUM"
        case getEpisodeDetail = "tv/SERIES_ID/season/SEASON_NUM/episode/EPISODE_NUM"
    }
}
