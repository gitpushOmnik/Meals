//
//  MealDetailsViewModel.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/28/24.
//

import Foundation 

/// A view model class responsible for managing meal details data.
class MealDetailsViewModel: ObservableObject {
    
    /// Published property to hold the meal details.
    @Published var mealDetails: MealDetail?
    
    /// The API manager for retrieving meal details data.
    private let mealsAPIManager: MealsAPIManager

    /// Initializes the view model with an optional custom API manager.
    /// - Parameter mealsAPIManager: The meals API manager. Defaults to `MealsAPIManager()`.
    init(mealsAPIManager: MealsAPIManager = MealsAPIManager()) {
        self.mealsAPIManager = mealsAPIManager
    }
    
    /// Fetches meal details data for a specified meal ID asynchronously.
    /// - Parameter mealID: The ID of the meal to fetch details for.
    func fetchMealDetails(for mealID: String) async {
        let response = await mealsAPIManager.retrieveMealDetails(for: mealID)
        
        switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.mealDetails = data.meals?.first
                }
                
            case .failure(let error):
                print("Error occured while fetching API Response. \(error.localizedDescription)")
        }
    }
}

