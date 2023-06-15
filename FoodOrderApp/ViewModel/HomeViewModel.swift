//
//  HomeViewModel.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 08.06.2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var promotions: Promotions?
    @Published var informations: InfoModel?
    
    @Published var promo = [
        Promotions(title: "1 + 1 = 3", image: "pizzaSale"),
        Promotions(title: "Оооооочень остренькие", image: "burgerNew"),
        Promotions(title: "50 % скидка до 15:00", image: "burgerSale"),
        Promotions(title: "50 % на сэты", image: "rollsSale"),
        Promotions(title: "Быстрее заказывай", image: "pizzaPodarok"),
    ]
    
    @Published var info = [
        InfoModel(title: "Доставка и контакты", subtitle: "Зона доставки, контакты, оплата", image: "truck"),
        InfoModel(title: "Отзывы", subtitle: "Оставьте отзыв", image: "otziv"),
        InfoModel(title: "Публичная оферта", subtitle: "Условия продажи", image: "writing"),
        InfoModel(title: "Условия оплаты", subtitle: "Условия оплаты банковской картой", image: "wallet"),
    ]
}
