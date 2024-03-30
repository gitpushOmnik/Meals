//
//  MealAPIManagerTests.swift
//  MealsTests
//
//  Created by Omkar Nikhal on 3/29/24.
//

import XCTest
@testable import Meals

/// Unit tests for the MealsAPIManager class.
class MealsAPIManagerTests: XCTestCase {

    var mealsAPIManager: MealsAPIManager!

    override func setUpWithError() throws {
        mealsAPIManager = MealsAPIManager()
    }

    override func tearDownWithError() throws {
        mealsAPIManager = nil
    }

    /// Test case for retrieving meals successfully.
    func testRetrieveMealsSuccess() async {
        let result = await mealsAPIManager.retrieveMeals(ofType: "Desserts")
        
        switch result {
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(let error):
            XCTFail("Failed to retrieve meals with error: \(error.localizedDescription)")
        }
    }

    /// Test case for retrieving meal details successfully.
    func testRetrieveMealDetailsSuccess() async {
        let result = await mealsAPIManager.retrieveMealDetails(for: MockData.testMealID)
        
        switch result {
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(let error):
            XCTFail("Failed to retrieve meal details with error: \(error.localizedDescription)")
        }
    }

    /// Test case for retrieving data with an invalid URL.
    func testRetrieveDataWithInvalidURL() async {
        let result = await mealsAPIManager.retrieveData(for: "invalidURL")
        
        switch result {
        case .success:
            XCTFail("Should fail with invalid URL.")
        case .failure(let error):
            XCTAssertNotNil(error)
        }
    }
}

