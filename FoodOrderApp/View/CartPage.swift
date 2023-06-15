//
//  CartPage.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 10.06.2023.
//

import SwiftUI

struct CartPage: View {
    
    @Binding var food: Food
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image(food.foodImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(food.title)
                    .font(.title3)
                
                Text("Категория: \(food.foodCategory.rawValue)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                HStack(spacing: 10) {
                    
                    Text("Количество")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Button {
                        food.quantity = (food.quantity > 0 ? (food.quantity - 1) : 0)
                    } label: {
                        Image(systemName: "minus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.purple)
                            .cornerRadius(4)
                    }
                    
                    Text("\(food.quantity)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Button {
                        food.quantity += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.purple)
                            .cornerRadius(4)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
