//
//  MealInstructions.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/29/24.
//

import SwiftUI

/// A view representing the instructions section of meal details.
struct MealInstructions: View {
    
    /// The array of instructions for the meal.
    let instructions: [String]?

    init(_ instructions: [String]?) {
        self.instructions = instructions
    }
    
    var body: some View {
        if let instructions = instructions {
            Text(Constants.Strings.instructions)
                .font(.system(size: Constants.Sizes.titleSize))
                .fontDesign(.serif)
                .padding(.vertical, Constants.Paddings.instructionVertical)

            VStack(alignment: .leading, spacing: 0) {
                ForEach(instructions.indices, id: \.self) { index in
                    Text("\(index + 1). \(instructions[index])\n")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Constants.Paddings.instructionRow)
                        .padding(.top, Constants.Paddings.instructionRowTop)
                        .background(index % 2 == 1 ? Color.white : Color.gray.opacity(Constants.Sizes.instructionsBgOpacity))
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MealInstructions(["Take SaucePan and Wok", "Heat and oil it up", "Crack eggs and season it", "Serve with garnishing and enjoy"])
}
