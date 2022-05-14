//
//  FoodView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

// TODO: EXTRACT VIEWS INTO VARIABLES
// TODO: FINISH ADDING ALL NUTRITION INFO

struct FoodView: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(food.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            Text(food.ingredients)
                .fontWeight(.medium)
            
            DisclosureGroup(
                content: {
                    VStack(alignment: .leading) {
                        // extract to view that expands vstack
                        HStack {
                            Spacer()
                        }
                        Text("Calories: \(food.nutrition.calories?.description ?? "N/A")")
                        
                        Text("Grams of Added Sugar: \(food.nutrition.gramsAddedSugar?.description ?? "N/A")")
                        
                        Text("Grams of Carbs: \(food.nutrition.gramsCarbs?.description ?? "N/A")")
                         
                         Text("Grams of Fat: \(food.nutrition.gramsFat?.description ?? "N/A")")
                        
                        Text("Grams of Fiber: \(food.nutrition.gramsFiber?.description ?? "N/A")")
                        
                        Text("Grams of Protein: \(food.nutrition.gramsProtein?.description ?? "N/A")")
                        
                        Text("Grams of Saturated Fat: \(food.nutrition.gramsSaturatedFat?.description ?? "N/A")")
                        
                        Text("Grams of Sugar: \(food.nutrition.gramsSugar?.description ?? "N/A")")
                    }
                }, label: {
                    Text("Nutrition")
                        .font(.headline)
                }
            )
            .accentColor(Color.black)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(10)
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(food: Food(name: "Hamburger", ingredients: "Beef, cheese, bun, onion", nutrition: Nutrition(calories: 100, gramsAddedSugar: 100, gramsCarbs: 100, gramsFat: 100, gramsFiber: 100, gramsProtein: 100, gramsSaturatedFat: 100, gramsSugar: 100, gramsTransFat: 100, iuVitaminA: 100, mgCalcium: 100, mgCholesterol: 100, mgIron: 100, mgPotassium: 100, mgSodium: 100, mgVitaminC: 100, mgVitaminD: 100, rawCalories: 100, reVitaminA: 100), servingSize: ServingSize(servingSizeAmount: "100", servingSizeUnit: "Grams")))
    }
}
