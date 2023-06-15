//
//  HomeView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 06.06.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            
                LocationView()
                
                Text("Акции")
                    .font(.custom("Montserrat-Bold", size: 30))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        
                        ForEach(homeViewModel.promo, id: \.self) { promo in
                            PromoView(promo: promo)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top)
                
                VStack(spacing: 20) {
                    
                    ForEach(homeViewModel.info, id: \.self) { promo in
                        InfoView(info: promo)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)
            
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Bg").ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
