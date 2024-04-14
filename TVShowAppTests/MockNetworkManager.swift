//
//  MockNetworkManager.swift
//  TVShowAppTests
//
//  Created by Faisal Shahzad on 14/04/2024.
//

import XCTest
import FSNetworkManager
@testable import TVShowApp


class MockNetworkManager: RequestProtocol {
    var shouldThrowError = false
    
    func sendGetRequest(_ url: String, params: [String : Any], headers: [String : Any], onComplete: @escaping completionHandler) {
        // Simulate a network request and provide mock response data
        
        // Mock response data
        let responseData = Data("{\"name\": \"billion\"}".utf8)
        let mockResponse = HTTPURLResponse(url: URL(string: "mockURL")!, statusCode: shouldThrowError ? 404 : 200, httpVersion: nil, headerFields: nil)
        
        onComplete(shouldThrowError ? nil : responseData, mockResponse, nil, nil)
    }
    
    func sendRequest(method: HTTPMethod, _ url: String, body: [String : Any], headers: [String : Any], params: [String : Any], onComplete: @escaping completionHandler) {
        
    }
}
