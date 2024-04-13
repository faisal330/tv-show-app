//
//  MockNetworkManager.swift
//  TVShowAppTests
//
//  Created by Faisal Shahzad on 14/04/2024.
//

import XCTest
import FSNetworkManager
@testable import TVShowApp

//class MockNetworkManager: GetRequestProtocol {
//    
//    var capturedURL: String?
//    var capturedParams: [String: Any]?
//    var capturedHeaders: [String: Any]?
//    var shouldReturnData: Data?
//    var shouldReturnResponse: URLResponse?
//    var shouldReturnError: Error?
//    
//    func sendGetRequest(_ url: String, params: [String : Any], headers: [String : Any], onComplete: @escaping (Data?, URLResponse?, Error?, URLRequest?) -> Void) {
//        capturedURL = url
//        capturedParams = params
//        capturedHeaders = headers
//        onComplete(shouldReturnData, shouldReturnResponse, shouldReturnError, nil)
//
//    }
//}

class MockNetworkManager: GetRequestProtocol {
    var shouldThrowError = false
    
    func sendGetRequest(_ url: String, params: [String : Any], headers: [String : Any], onComplete: @escaping completionHandler) {
        // Simulate a network request and provide mock response data
        
        // Mock response data
        let responseData = Data("{\"name\": \"billion\"}".utf8)
        let mockResponse = HTTPURLResponse(url: URL(string: "mockURL")!, statusCode: shouldThrowError ? 404 : 200, httpVersion: nil, headerFields: nil)
        
        onComplete(shouldThrowError ? nil : responseData, mockResponse, nil, nil)
    }
}
