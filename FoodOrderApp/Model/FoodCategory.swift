//
//  FoodCategory.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 06.06.2023.
//

import SwiftUI

struct Food: Identifiable, Hashable {
    var id = UUID().uuidString
    var foodCategory: FoodCategory
    var title: String
    var description: String
    var price: String
    var foodImage: String
    var quantity: Int = 1
}


enum FoodCategory: String, CaseIterable {
    case burger = "Бургеры"
    case pizza = "Пицца"
    case rools = "Роллы"
    case shaurma = "Шаурма"
}

