//
//  MealsList.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI

/// A view displaying a list of meals.
struct MealsList: View {
    
    /// The array of meals to display in the list.
    private let meals: [Meal]

    init(_ meals: [Meal]) {
        self.meals = meals
    }
    
    var body: some View {
        List(Array(meals.enumerated()), id: \.element.id) { index, meal in
            NavigationLink(destination: MealDetailsView(MealDetailsViewModel(), meal.id)) {
                MealRow(meal)
            }
            .listRowBackground(index.isMultiple(of: 2) ? Color.gray.opacity(0.1) : Color.clear)
        }
        .listStyle(.plain)
        .navigationBarTitle(Constants.Strings.navigationBarTitle)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color(Constants.Strings.secondaryColor), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    MealsList([Meal(id: "52898",
                    title: "Chelsea Buns",
                    thumbnail: "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg")])
}
