//
//  Menu.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/9/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// TODO: Implement Menu

struct Nutrition: Codable, Hashable {
    var calories: Double?
    var gramsAddedSugar: Double?
    var gramsCarbs: Double?
    var gramsFat: Double?
    var gramsFiber: Double?
    var gramsProtein: Double?
    var gramsSaturatedFat: Double?
    var gramsSugar: Double?
    var gramsTransFat: Double?
    var iuVitaminA: Double?
    var mgCalcium: Double?
    var mgCholesterol: Double?
    var mgIron: Double?
    var mgPotassium: Double?
    var mgSodium: Double?
    var mgVitaminC: Double?
    var mgVitaminD: Double?
    var rawCalories: Double?
    var reVitaminA: Double?
    
    enum CodingKeys: String, CodingKey {
        case calories
        case gramsAddedSugar = "g_added_sugar"
        case gramsCarbs = "g_carbs"
        case gramsFat = "g_fat"
        case gramsFiber = "g_fiber"
        case gramsProtein = "g_protein"
        case gramsSaturatedFat = "g_saturated_fat"
        case gramsSugar = "g_sugar"
        case gramsTransFat = "g_trans_fat"
        case iuVitaminA = "iu_vitamin_a"
        case mgCalcium = "mg_calcium"
        case mgCholesterol = "mg_cholesterol"
        case mgIron = "mg_iron"
        case mgPotassium = "mg_potassium"
        case mgSodium = "mg_sodium"
        case mgVitaminC = "mg_vitamin_c"
        case mgVitaminD = "mg_vitamin_d"
        case rawCalories = "raw_calories"
        case reVitaminA = "re_vitamin_a"
    }
}

struct ServingSize: Codable, Hashable {
    var servingSizeAmount: String? // wtf?
    var servingSizeUnit: String?
    
    enum CodingKeys: String, CodingKey {
        case servingSizeAmount = "serving_size_amount"
        case servingSizeUnit = "serving_size_unit"
    }
}

struct Food: Codable, Hashable {
    var name: String
    var ingredients: String
    var nutrition: Nutrition
    var servingSize: ServingSize
    
    enum CodingKeys: String, CodingKey {
        case name
        case ingredients
        case nutrition
        case servingSize = "serving_size"
    }
}

struct Menu: Codable, Identifiable {
    @DocumentID var id: String?
    var date: Date
    var breakfast: [Food]?
    var lunch: [Food]?
    var dinner: [Food]?
}
