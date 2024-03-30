//
//  MealsViewModelTests.swift
//  MealsTests
//
//  Created by Omkar Nikhal on 3/29/24.
//

// MealsViewModelTests.swift

import XCTest
@testable import Meals

/// Unit tests for the MealsViewModel class.
class MealsViewModelTests: XCTestCase {

    var mealsViewModel: MealsViewModel!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    /// Test case for fetching meals successfully.
    func testFetchMealsSuccess() async {
        mealsViewModel = MealsViewModel(mealsAPIManager: MockMealsAPIManager(apiFailureTriggered: false))
        await mealsViewModel.fetchMeals(for: "Desserts")
        let expectation = expectation(description: "Data fetched and decoded successfully.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.mealsViewModel.meals, MockData.testMealList.meals)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }

    /// Test case for fetching meals with an invalid category.
    func testFetchMealsWithInvalidCategory() async {
        mealsViewModel = MealsViewModel(mealsAPIManager: MockMealsAPIManager(apiFailureTriggered: true))
        await mealsViewModel.fetchMeals(for: "imvfoimwviomirmio")
        let expectation = expectation(description: "Decoding failed with invalid category.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNil(self.mealsViewModel.meals)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
    
    /// Test case for fetching meals with an empty category.
    func testFetchMealsFailure() async {
        mealsViewModel = MealsViewModel(mealsAPIManager: MockMealsAPIManager(apiFailureTriggered: true))
        await mealsViewModel.fetchMeals(for: "")
        let expectation = expectation(description: "Decoding failed with empty category.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNil(self.mealsViewModel.meals)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
}
