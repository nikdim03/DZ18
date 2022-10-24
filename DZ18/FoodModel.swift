//
//  FoodModel.swift
//  DZ18
//
//  Created by Dmitriy on 10/17/22.
//

import UIKit

struct SectionedFoodModel {
    enum Category: String, CaseIterable {
        case vegetables = "Vegetables"
        case fruits = "Fruits"
        case drinks = "Drinks"
    }
    var category: Category
    var foodArray: [FoodModel]
}

struct FoodModel {
    let name: String
    let price: Float
    let calories: Int
    let proteins: Float
    let carbs: Float
    let fats: Float
    let image: UIImage?
}
