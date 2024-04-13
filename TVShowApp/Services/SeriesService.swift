//
//  SeriesService.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation
import FSNetworkManager


struct SeriesService {
    static let shared = SeriesService()
    private init() { }

    var networkManager: GetRequestProtocol = NetworkManager.shared

    
    func getSeriesDetail(id: String, onComplete: @escaping ((Result<SeriesInfo, AppError>)->Void)) {
        
        let urlString = URLHelper.shared.getURLString(with: URI.Series.getDetail.rawValue).replacingOccurrences(of: ParamKeys.SERIES_ID, with: id)

        networkManager.sendGetRequest(urlString, params: [:], headers: [:]) { (data, response, error, request) in
            
            guard APIErrorHandler.shared.handleError(data: data, response: response, error: error, request: request, onComplete: onComplete) else { return }
            
            ResponseManager.shared.decode(data: data, response: response, error: error, onComplete: onComplete)
            
        }
    }
    
    func getSeasonDetail(seriesId: String, seasonNo: String, onComplete: @escaping ((Result<SeasonInfo, AppError>)->Void)) {
        
        let urlString = URLHelper.shared.getURLString(with: URI.Series.getSeasonDetail.rawValue).replaceOccurrences(with: [ParamKeys.SERIES_ID: seriesId, ParamKeys.SEASON_NUM: seasonNo])

        networkManager.sendGetRequest(urlString, params: [:], headers: [:]) { (data, response, error, request) in
            
            guard APIErrorHandler.shared.handleError(data: data, response: response, error: error, request: request, onComplete: onComplete) else { return }
            
            ResponseManager.shared.decode(data: data, response: response, error: error, onComplete: onComplete)
            
        }
    }
    
}
