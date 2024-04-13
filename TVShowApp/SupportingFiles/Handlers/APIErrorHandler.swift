//
//  APIErrorHandler.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

class APIErrorHandler {
    static let shared = APIErrorHandler()
    private init() {}
    
    func handleError<T:Codable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        request: URLRequest?,
        onComplete: @escaping ((Result<T, AppError>)->Void)) -> Bool
    
    {
        if let error = error{
            onComplete(.failure(AppError.error(error.localizedDescription)))
            return false
        }
        
        guard let res = response as? HTTPURLResponse else {
            onComplete(.failure(AppError.error(Constants.SomethingWentWrong)))
            return false
        }
        
        switch res.statusCode {
        case 401:
            onComplete(.failure(AppError.error(Constants.unAuthorized)))
            return false
            
        case 404:
            if let data = data, let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                onComplete(.failure(AppError.error(apiError.status_message ?? Constants.notFound)))
            } else {
                onComplete(.failure(AppError.error(Constants.badReponse)))
            }
            return false
            
        case 502:
            onComplete(.failure(AppError.error(Constants.SomethingWentWrong)))
            return false
       
        default:
            return true
        }
    }
}
