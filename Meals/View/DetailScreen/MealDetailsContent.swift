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
    private let details: MealDetail
    
    init(_ details: MealDetail) {
        self.details = details
    }
    
    var body: some View {
        VStack(spacing: Constants.Spacings.mealDetailsVertical) {
            MealHeader(details)
            MealInstructions(details.instructions)
            MealIngredients(details.ingredients, details.measurements)
        }
        .padding()
    }
}

#Preview {
    MealDetailsContent(MealDetail(title: "Banana Pancakes",
                                  imageURLString: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                                  id: "52855",
                                  ingredients: ["Eggs", "Baking Powder", "Vanilla Extract", "Oil", "Pecan Nuts", "Raspberries"],
                                  measurements: ["1 large", "2 medium", "pinch", "spinkling", "1 tsp ","25g","125g"]))
}
