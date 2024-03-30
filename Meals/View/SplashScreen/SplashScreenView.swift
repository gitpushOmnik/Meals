//
//  SplashScreenView.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/27/24.
//

import SwiftUI

/// A view representing the splash screen of the Meals app.
struct SplashScreenView: View {
    
    /// State variable to track the activation of the home screen.
    @State private var isHomeScreenActive = false
    
    /// State variable for displaying animated text during the splash screen.
    @State private var animatedText: String = ""
    
    /// The view model for managing meals data.
    @StateObject var mealsViewModel: MealsViewModel
    
    /// The view model for managing meal details data.
    @StateObject var mealDetailsViewModel: MealDetailsViewModel
    
    var body: some View {
        ZStack {
            if self.isHomeScreenActive {
                MealsListView(mealsViewModel, mealDetailsViewModel)
            }
            else {
                SplashScreenContent($animatedText)
            }
        }
        .onAppear {
            animateText()
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Delays.splashScreenDelay) {
                self.isHomeScreenActive = true
            }
        }
    }
    
    /// Animates the text during the splash screen.
    func animateText() {
        for (index, character) in Constants.Strings.splashScreenTitle.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText.append(character)
            }
        }
    }
}

#Preview {
    SplashScreenView(mealsViewModel: MealsViewModel(),
                     mealDetailsViewModel: MealDetailsViewModel())
}

