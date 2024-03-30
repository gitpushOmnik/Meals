//
//  MealsApp.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/27/24.
//

import SwiftUI

@main
struct MealsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView(mealsViewModel: MealsViewModel(), mealDetailsViewModel: MealDetailsViewModel())
        }
    }
}
