//
//  MealsAPIManager.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/28/24.
//

import Foundation

/// An API manager class responsible for handling meal data retrieval from a remote server.
class MealsAPIManager {

    /// Retrieves data asynchronously from a specified URL.
    /// - Parameter urlString: The URL string from which to retrieve data.
    /// - Returns: A result containing either the retrieved data or an error.
    func retrieveData(for urlString: String) async -> Result<Data, Error> {
        guard let url = URL(string: urlString) else { return .failure(MealsAPIError.invalidURL) }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard data.count != 0 else { return .failure(MealsAPIError.emptyResponse) }
            return .success(data)
        } catch {
            return .failure(MealsAPIError.requestFailed(message: error.localizedDescription))
        }
    }
    
    /// Retrieves meals data of a specified category asynchronously.
    /// - Parameter mealsCategory: The category of meals to retrieve.
    /// - Returns: A result containing either the retrieved meals data or an error.
    func retrieveMeals(ofType mealsCategory: String) async -> Result<Meals, Error> {
        let urlString = Constants.Network.apiBaseURL + Constants.Network.mealCategoryFilter + mealsCategory
        
        do {
            let result = await retrieveData(for: urlString)
            switch result {
                case .success(let data):
                    let response = try JSONDecoder().decode(Meals.self, from: data)
                    return .success(response)
                    
                case .failure(let error):
                    return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }

    /// Retrieves meal details data for a specified meal ID asynchronously.
    /// - Parameter mealID: The ID of the meal to retrieve details for.
    /// - Returns: A result containing either the retrieved meal details data or an error.
    func retrieveMealDetails(for mealID: String) async -> Result<MealDetails, Error> {
        let urlString = Constants.Network.apiBaseURL + Constants.Network.categoryDetailsFilter + mealID
        
        do {
            let result = await retrieveData(for: urlString)
            switch result {
                case .success(let data):
                    let response = try JSONDecoder().decode(MealDetails.self, from: data)
                    return .success(response)
                    
                case .failure(let error):
                    return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
}
