//
//  HomeView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 06.06.2023.
//

import SwiftUI

struct MenuView: View {
    var animation: Namespace.ID
    @EnvironmentObject var sharedData: SharedDetailViewModel
    @StateObject var menuData = MenuViewModel()
    
    var columns = [GridItem(.adaptive(minimum: 120), spacing: 20)]
    
    var body: some View {
        
        VStack {
            
            VStack(spacing: 15) {
                
                LocationView()
                
                Text("Заказ вкусняшек \nна ваш выбор")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18) {
                        ForEach(FoodCategory.allCases, id: \.self) { food in
                            foodCategoryView(type: food)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        ForEach(menuData.filteredFoods) { food in
                            foodCardView(food: food)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Bg"))
        .onChange(of: menuData.foodCategory) { newValue in
            menuData.filterFoods()
        }
    }
    
    @ViewBuilder
    func foodCardView(food: Food) -> some View {
        VStack(spacing: 10) {
            
            ZStack {

                if sharedData.showDetailFood {
                    Image(food.foodImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(food.foodImage)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "\(food.id)IMAGE", in: animation)
                }
            }
            .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
            
            Text(food.title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top, 5)
            
            Text(food.price)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top, 5)
                .foregroundColor(.red)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 22)
        .background(Color("CardBG")
            .cornerRadius(20)
        )
        .onTapGesture {
            
            withAnimation(.easeInOut) {
                sharedData.detailFood = food
                sharedData.showDetailFood = true
            }
        }
    }
    
    @ViewBuilder
    func foodCategoryView(type: FoodCategory) -> some View {
        Button(action: {
            withAnimation {
                menuData.foodCategory = type
            }
        }) {
            Text(type.rawValue)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(menuData.foodCategory == type ? Color.red : Color.gray)
                .padding(.bottom, 10)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
