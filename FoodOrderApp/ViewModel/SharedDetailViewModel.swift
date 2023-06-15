//
//  SharedDetailViewModel.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 07.06.2023.
//

import SwiftUI


class SharedDetailViewModel: ObservableObject {
    
    @Published var detailFood: Food?
    @Published var showDetailFood: Bool = false
    @Published var likedFoods: [Food] = []
    @Published var cartFoods: [Food] = []
    
    func getTotalPrice() -> String {
        var result = 0
        
        cartFoods.forEach { food in
            let price = food.price.replacingOccurrences(of: "Руб", with: "") as NSString
            
            let quantity = food.quantity
            let priceTotal = quantity * price.integerValue
            
            result += priceTotal
        }
        
        return "\(result) руб"
    }
}
 
