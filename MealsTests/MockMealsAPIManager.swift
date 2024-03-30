//
//  MockMealsAPIManager.swift
//  MealsTests
//
//  Created by Omkar Nikhal on 3/29/24.
//

import Foundation
@testable import Meals

/// A mock implementation of the MealsAPIManager class for testing purposes.
final class MockMealsAPIManager: MealsAPIManager {
    
    /// A boolean flag to simulate API failure triggering.
    var apiFailureTriggered: Bool
   
    /// Initializes the mock API manager with the specified failure trigger.
    /// - Parameter apiFailureTriggered: A boolean flag indicating whether to simulate API failure.
    init(apiFailureTriggered: Bool) {
        self.apiFailureTriggered = apiFailureTriggered
    }
    
    /// Simulates retrieving data from a URL, either succeeding or failing based on the `apiFailureTriggered` flag.
    override func retrieveData(for urlString: String) async -> Result<Data, Error> {
        if apiFailureTriggered {
            return .failure(MealsAPIError.requestFailed(message: "Error decoding API Response"))
        }
        return .success(Data())
    }
    
    /// Simulates retrieving meals data, either succeeding with mock data or failing based on the `apiFailureTriggered` flag.
    override func retrieveMeals(ofType mealsCategory: String) async -> Result<Meals, Error> {
        if apiFailureTriggered {
            return .failure(MealsAPIError.requestFailed(message: "Error decoding API Response"))
        }
        return .success(MockData.testMealList)
    }
    
    /// Simulates retrieving meal details data, either succeeding with mock data or failing based on the `apiFailureTriggered` flag.
    override func retrieveMealDetails(for mealID: String) async -> Result<MealDetails, Error> {
        if apiFailureTriggered {
            return .failure(MealsAPIError.requestFailed(message: "Error decoding API Response"))
        }
        return .success(MockData.testMealDetail)
    }
}
