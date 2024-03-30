//
//  MealRow.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI
import Kingfisher

/// A view representing a row in the meals list.
struct MealRow: View {
    
    /// The meal item to display in the row.
    private let meal: Meal

    init(_ meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        HStack(spacing: Constants.Spacings.mealRowHorizontal) {
            KFImage.url(URL(string: meal.thumbnail))
                .placeholder { Color.gray }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: Constants.Sizes.mealRowImageSize, 
                       maxHeight: Constants.Sizes.mealRowImageSize)
                .clipped()
                .cornerRadius(Constants.Sizes.mealRowCornerRadius)

            Text(meal.title)
                .font(.title3)
                .fontDesign(.serif)
                .minimumScaleFactor(Constants.Sizes.titleScaleFactor)
        }
        .padding(.vertical, Constants.Paddings.mealRowVertical)
    }
}

#Preview {
    MealRow(Meal(id: "52898",
                 title: "Chelsea Buns",
                 thumbnail: "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg"))
}
