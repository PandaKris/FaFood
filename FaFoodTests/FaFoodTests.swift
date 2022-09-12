//
//  FaFoodTests.swift
//  FaFoodTests
//
//  Created by Kristanto Sean N on 09/09/22.
//

import XCTest
@testable import FaFood

class FaFoodTests: XCTestCase {
    
    var viewModel : ContentViewModel?
    var percentFormatter : NumberFormatter?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ContentViewModel()
        viewModel?.restaurants = [
            Restaurant(name: "MCD", image: "MCD"),
            Restaurant(name: "KFC", image: "KFC"),
            Restaurant(name: "A&W", image: "A&W")
        ]
        
        percentFormatter = NumberFormatter()
        percentFormatter?.numberStyle = .percent
        percentFormatter?.maximumFractionDigits = 1

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMeasureNewWeightValue() throws {
        
        //given
        viewModel?.restaurants[0].weight = 2
        
        //when
        viewModel?.updateWeightValue()
        
        //then
        XCTAssertEqual(viewModel?.restaurants[0].weightedValue, 0.5, "Wrong Update Weight Value")
        XCTAssertEqual(viewModel?.restaurants[1].weightedValue, 0.25, "Wrong Update Weight Value")
        XCTAssertEqual(viewModel?.restaurants[2].weightedValue, 0.25, "Wrong Update Weight Value")
        
        XCTAssertEqual(viewModel?.restaurants[0].weightedPercentage, "50%", "Wrong Percentage Outcome")
        XCTAssertEqual(viewModel?.restaurants[1].weightedPercentage, "25%", "Wrong Percentage Outcome")
        XCTAssertEqual(viewModel?.restaurants[2].weightedPercentage, "25%", "Wrong Percentage Outcome")

        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
