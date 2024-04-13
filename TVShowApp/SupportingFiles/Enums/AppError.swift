//
//  AppError.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import Foundation

enum AppError: Error {
    case error(_ message: String)
}

extension AppError {
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}
