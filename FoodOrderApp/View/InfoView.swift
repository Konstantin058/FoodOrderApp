//
//  InfoView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 09.06.2023.
//

import SwiftUI

struct InfoView: View {
    
    var info: InfoModel
    
    var body: some View {
        
        HStack {
            
            HStack(spacing: 15) {
                
                Image(info.image)
                    .resizable()
                    .scaledToFit()
                    .font(.title)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(info.title)
                        .font(.title3)
                    
                    Text(info.subtitle)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            Button(action: {}) {
                
                Image(systemName: "arrow.right")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(info: InfoModel(title: "Доставка и контакты", subtitle: "Зона доставки, контакты, оплата", image: "truck"))
    }
}
