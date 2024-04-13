//
//  TVShowAppTests.swift
//  TVShowAppTests
//
//  Created by Faisal Shahzad on 14/04/2024.
//

import XCTest
import FSNetworkManager
@testable import TVShowApp


final class TVShowAppTests: XCTestCase {
    
    var seriesService: SeriesService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        seriesService = SeriesService.shared
        mockNetworkManager = MockNetworkManager()
    }
    
    override func tearDown() {
        seriesService = nil
        super.tearDown()
    }
    
    func testGetSeriesDetail_Success() {
        mockNetworkManager.shouldThrowError = false
        seriesService.networkManager = mockNetworkManager
        
        let expectation = XCTestExpectation(description: "Get series detail")
        seriesService.getSeriesDetail(id: "12345") { result in
            switch result {
            case .success(let seriesInfo):
                // Assert your success scenario here
                XCTAssertEqual(seriesInfo.name, "billion") // Verify data is parsed correctly
                expectation.fulfill()
            case .failure(let error):
                // Handle failure scenario or assert failure
                XCTFail("Failed to get series detail: \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
    
    func testGetSeriesDetail_Failure() {
        mockNetworkManager.shouldThrowError = true
        seriesService.networkManager = mockNetworkManager
        
        let expectation = XCTestExpectation(description: "Get series detail")
        seriesService.getSeriesDetail(id: "12345") { result in
            switch result {
            case .success(let seriesInfo):
                // Assert your success scenario here
                XCTFail("Expected failure, got success")
            case .failure(let error):
                // Handle failure scenario or assert failure
                XCTAssertEqual(error.localizedDescription, Constants.badReponse)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
    
    func testGetSeasonDetail_Success() {
        mockNetworkManager.shouldThrowError = false
        seriesService.networkManager = mockNetworkManager
        
        let expectation = XCTestExpectation(description: "Get season detail")
        seriesService.getSeasonDetail(seriesId: "12345", seasonNo: "1") { result in
            switch result {
            case .success(let seriesInfo):
                // Assert your success scenario here
                XCTAssertEqual(seriesInfo.name, "billion") // Verify data is parsed correctly
                expectation.fulfill()
            case .failure(let error):
                // Handle failure scenario or assert failure
                XCTFail("Failed to get series detail: \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
    
    func testGetSeasonDetail_Failure() {
        mockNetworkManager.shouldThrowError = true
        seriesService.networkManager = mockNetworkManager
        
        let expectation = XCTestExpectation(description: "Get season detail")
        seriesService.getSeasonDetail(seriesId: "12345", seasonNo: "1") { result in
            switch result {
            case .success(let seriesInfo):
                // Assert your success scenario here
                XCTFail("Expected failure, got success")
            case .failure(let error):
                // Handle failure scenario or assert failure
                XCTAssertEqual(error.localizedDescription, Constants.badReponse)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
