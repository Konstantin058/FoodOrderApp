//
//  PromoView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 08.06.2023.
//

import SwiftUI

struct PromoView: View {
    var promo: Promotions
    
    var body: some View {
        ZStack(alignment: .top) {
            
            ZStack(alignment: .bottom) {
                
                Image(promo.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 200)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    
                    Text(promo.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
                .padding(.trailing, 100)
                .frame(width: 300, alignment: .leading)
            }
        }
        .padding()
        .frame(width: 300, height: 200)
        .cornerRadius(20)
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView(promo: Promotions(title: "50 % скидка до 15:00", image: "burgerNew"))
    }
}
