//
//  TVShowAppUITests.swift
//  TVShowAppUITests
//
//  Created by Faisal Shahzad on 14/04/2024.
//

import XCTest
import Foundation
import FSNetworkManager
@testable import TVShowApp

extension XCUIElement {
    func tap(wait: Int, test: XCTestCase) {
        if !isHittable {
            test.expectation(for: NSPredicate(format: "hittable == true"), evaluatedWith: self, handler: nil)
            test.waitForExpectations(timeout: TimeInterval(wait), handler: nil)
        }
        tap()
    }
}

final class TVShowAppUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        NetworkManager.shared.provideAPIKey("DummyAPIKey")
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReadMoreButtonExpandsContent() {
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod porttitor lorem sit amet tincidunt. Donec vitae neque vitae mauris rhoncus tempus. Praesent feugiat posuere odio, sit amet mattis quam elementum malesuada."
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: self.classForCoder))
        let vc = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController") as! DetailViewController
        vc.loadViewIfNeeded()
        
        // Set initial content
        vc.overviewLabel.text = text
        vc.overviewLabel.numberOfLines = 3
        
        // Simulate button tap
        vc.readMoreBtn.sendActions(for: .touchUpInside)
        
        // Verify label properties are updated
        XCTAssertEqual(vc.overviewLabel.numberOfLines, 0, "Label should have unlimited lines after tapping Read More")
        XCTAssertEqual(vc.readMoreBtn.titleLabel?.text, "Read Less", "Button text should change to Read Less")
        
        // Simulate button tap again
        vc.readMoreBtn.sendActions(for: .touchUpInside)
        
        // Verify label properties are reset
        XCTAssertEqual(vc.overviewLabel.numberOfLines, 3, "Label should have 3 lines after tapping Read Less")
        XCTAssertEqual(vc.readMoreBtn.titleLabel?.text, "Read More", "Button text should change back to Read More")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
