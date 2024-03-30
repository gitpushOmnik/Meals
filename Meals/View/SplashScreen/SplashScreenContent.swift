//
//  SplashScreenContent.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI

/// A view representing the content displayed during the splash screen.
struct SplashScreenContent: View {
    
    /// Binding for the animated text displayed during the splash screen.
    @Binding private var animatedText: String
    
    init(_ animatedText: Binding<String>) {
        self._animatedText = animatedText
    }
    
    var body: some View {
        ZStack {
            Color(Constants.Strings.secondaryColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(animatedText)
                    .font(.system(size: Constants.Sizes.splashScreenText,
                                  weight: .bold, design: .serif))
                    .foregroundColor(Color(Constants.Strings.primaryColor))
                    .padding()
                
                Image(systemName: Constants.Strings.forkKnifeIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.Sizes.splashScreenImage,
                           height: Constants.Sizes.splashScreenImage)
                    .foregroundColor(Color(Constants.Strings.primaryColor))
                    .padding()
            }
        }
    }
}
