//
//  MealImage.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI
import Kingfisher

/// A view representing the header section of meal details.
struct MealHeader: View {
    
    /// The details of the meal to display in the header.
    private let details: MealDetail

    init(_ details: MealDetail) {
        self.details = details
    }
    
    var body: some View {
        ZStack {
            if let imageURLString = details.imageURLString {
                KFImage(URL(string: imageURLString))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .opacity(Constants.Sizes.detailsImageOpacity)
                    .cornerRadius(Constants.Sizes.detailsImageCornerRadius)
            }

            VStack {
                Spacer()
                if let name = details.title {
                    Text(name)
                        .font(.system(size: Constants.Sizes.mainTitleSize))
                        .fontDesign(.serif)
                        .minimumScaleFactor(Constants.Sizes.titleScaleFactor)
                        .bold()
                        .padding(Constants.Paddings.detailsTitle)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(Constants.Sizes.detailsTitleOpacity))
                        .padding(.bottom, Constants.Paddings.detailsTitleBottom)
                }
            }
        }
    }
}

#Preview {
    MealHeader(MealDetail(title: "Banana Pancakes",
                          imageURLString: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                          id: "52855",
                          ingredients: ["Eggs", "Baking Powder", "Vanilla Extract", "Oil", "Pecan Nuts", "Raspberries"],
                          measurements: ["1 large", "2 medium", "pinch", "spinkling", "1 tsp ","25g","125g"]))
}
