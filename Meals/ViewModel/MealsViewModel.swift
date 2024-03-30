//
//  MealsViewModel.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/27/24.
//

import Foundation

/// A view model class responsible for managing meal data.
class MealsViewModel: ObservableObject {
    
    /// Published property to hold the list of meals.
    @Published var meals: [Meal]?
    
    /// The API manager for retrieving meals data.
    let mealsAPIManager: MealsAPIManager

    /// Initializes the view model with an optional custom API manager.
    /// - Parameter mealsAPIManager: The meals API manager. Defaults to `MealsAPIManager()`.
    init(mealsAPIManager: MealsAPIManager = MealsAPIManager()) {
        self.mealsAPIManager = mealsAPIManager
    }
   
    /// Fetches meals data for a specified category asynchronously.
    /// - Parameter category: The category of meals to fetch.
    func fetchMeals(for category: String) async {
        let response = await mealsAPIManager.retrieveMeals(ofType: category)
        
        switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.meals = data.meals?.sorted { $0.title < $1.title } ?? []
                }
                
            case .failure(let error):
                print("Error occured while fetching API Response. \(error.localizedDescription)")
        }
    }
}
