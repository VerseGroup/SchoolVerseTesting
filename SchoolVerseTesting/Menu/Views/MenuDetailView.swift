//
//  MenuDetailView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

struct MenuDetailView: View {
    let menu: Menu
    
    var body: some View {
        VStack {
            Text(menu.date.weekDateString())
                .font(.largeTitle)
                .bold()
                .padding()
            
            VStack {
                TabView {
                    breakfast
                    lunch
                    dinner
                }
                .padding()
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(menu: Menu(id: nil, date: Date.now, breakfast: [], lunch: [], dinner: []))
    }
}

extension MenuDetailView {
    private var breakfast: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
            }
            Text("Breakfast")
                .font(.title)
                .bold()
            Text("The most important meal of the day!")
            if let breakfast = menu.breakfast, !breakfast.isEmpty {
                ScrollView {
                    ForEach(breakfast, id: \.self) { breakfastFood in
                        FoodView(food: breakfastFood)
                    }
                }
            } else {
                Text("No breakfast...")
            }
            Spacer()
        }
    }
    
    private var lunch: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
            }
            Text("Lunch")
                .font(.title)
                .bold()
            Text("Get through the day!")
            if let lunch = menu.lunch, !lunch.isEmpty {
                ScrollView {
                    ForEach(lunch, id: \.self) { lunchFood in
                        FoodView(food: lunchFood)
                    }
                }
            } else {
                Text("No lunch...")
            }
            Spacer()
        }
    }
    
    private var dinner: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
            }
            Text("Dinner")
                .font(.title)
                .bold()
            Text("good luck boarders lol")
            if let dinner = menu.dinner, !dinner.isEmpty {
                ScrollView {
                    ForEach(dinner, id: \.self) { dinnerFood in
                        FoodView(food: dinnerFood)
                    }
                }
            } else {
                Text("No dinner...")
            }
            Spacer()
        }
    }
}
