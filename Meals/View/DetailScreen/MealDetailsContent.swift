//
//  MealDetailsContent.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI

/// A view representing the content of meal details.
struct MealDetailsContent: View {
    
    /// The details of the meal to display.
    let details: MealDetail

    var body: some View {
        VStack(spacing: Constants.Spacings.mealDetailsVertical) {
            MealHeader(details: details)
            MealInstructions(instructions: details.instructions)
            MealIngredients(ingredients: details.ingredients, measurements: details.measurements)
        }
        .padding()
    }
}
