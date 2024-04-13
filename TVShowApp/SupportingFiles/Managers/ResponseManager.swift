//
//  ResponseManager.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

class ResponseManager {
    static let shared = ResponseManager()
    private init() {}
    
    func decode<T:Codable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        onComplete: @escaping ((Result<T, AppError>)->Void))
    
    {
        if let data = data {
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    onComplete(.success(response))
                }
            }
            catch let error {
                onComplete(.failure(AppError.error(error.localizedDescription)))
                print(error)
            }
        }
    }
    
}
