//
//  MealIngredients.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI

/// A view representing the ingredients section of meal details.
struct MealIngredients: View {
    
    /// The array of ingredients for the meal.
    let ingredients: [String]
    
    /// The array of measurements corresponding to the ingredients.
    let measurements: [String]

    init(_ ingredients: [String], _ measurements: [String]) {
        self.ingredients = ingredients
        self.measurements = measurements
    }
    
    var body: some View {
        Text(Constants.Strings.ingredients)
            .font(.system(size: Constants.Sizes.titleSize))
            .fontDesign(.serif)
            .padding(.vertical, Constants.Paddings.ingredientsVertical)

        ForEach(ingredients.indices, id: \.self) { index in
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text(ingredients[index])
                        .frame(alignment: .leading)
                    Spacer()
                    Text(measurements[index])
                        .frame(alignment: .trailing)
                        .foregroundColor(.gray)
                }

                Divider()
            }
            .frame(maxWidth: Constants.Sizes.ingredientsWidth)
        }
    }
}

#Preview {
    MealIngredients(["Eggs", "Baking Powder", "Vanilla Extract", "Oil", "Pecan Nuts", "Raspberries"],
                    ["1 large", "2 medium", "pinch", "spinkling", "1 tsp ","25g","125g"])
}
