//
//  MealDetailsViewModelTests.swift
//  MealsTests
//
//  Created by Omkar Nikhal on 3/29/24.
//

import XCTest
import Foundation
@testable import Meals

/// Unit tests for the MealDetailsViewModel class.
class MealDetailsViewModelTests: XCTestCase {

    var mealDetailsViewModel: MealDetailsViewModel!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    /// Test case for fetching meal details successfully.
    func testFetchMealDetails() async throws {
        mealDetailsViewModel = MealDetailsViewModel(mealsAPIManager: MockMealsAPIManager(apiFailureTriggered: false))
        let expectedMealDetail = MockData.testMealDetail
        let expectation = expectation(description: "Data Details fetched and decoded successfully.")

        await mealDetailsViewModel.fetchMealDetails(for: MockData.testMealID)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(expectedMealDetail.meals?.count, 1)
            XCTAssertEqual(self.mealDetailsViewModel.mealDetails?.id, expectedMealDetail.meals?.first?.id)
            XCTAssertEqual(self.mealDetailsViewModel.mealDetails?.title, expectedMealDetail.meals?.first?.title)
            XCTAssertEqual(self.mealDetailsViewModel.mealDetails?.imageURLString, expectedMealDetail.meals?.first?.imageURLString)
            XCTAssertEqual(self.mealDetailsViewModel.mealDetails?.ingredients, expectedMealDetail.meals?.first?.ingredients)
            XCTAssertEqual(self.mealDetailsViewModel.mealDetails?.measurements, expectedMealDetail.meals?.first?.measurements)
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
}
