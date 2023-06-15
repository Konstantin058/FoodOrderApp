//
//  CartView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 07.06.2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var sharedData: SharedDetailViewModel
    
    @State var showDeleteItem = false
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 10) {
                
                VStack {
                    
                    HStack {
                        
                        Text("Корзина")
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                showDeleteItem.toggle()
                            }
                        } label: {
                            Image("delete")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        if sharedData.cartFoods.isEmpty {
                            Group {
                                Image("noLiked")
                                    .resizable()
                                    .scaledToFit()
                                
                                
                                Text("Корзина путса 🥲")
                                    .font(.custom("Montserrat-Bold", size: 20))
                                    .fontWeight(.semibold)
                                
                                Text("Нажми скорее на кнопку заказать😁")
                                    .font(.custom("Montserrat-Light", size: 17))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            VStack(spacing: 15) {
                                
                                ForEach($sharedData.cartFoods) { $food in
                                    
                                    HStack(spacing: 0) {
                                        
                                        if showDeleteItem {
                                            Button {
                                                deleteFoods(food: food)
                                            } label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            
                                        }
                                        CartPage(food: $food)
                                    }
                                }
                            }
                            .padding(.top, 25)
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                
                if !sharedData.cartFoods.isEmpty {
                    
                    Group {
                        
                        HStack {
                            
                            Text("Всего")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(sharedData.getTotalPrice())
                                .font(.title2)
                                .bold()
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Оформить")
                                .font(.title2)
                                .bold()
                                .padding(.vertical)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(.red)
                                .cornerRadius(15)
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical)
                    }
                    .padding(.horizontal, 25)
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Bg").ignoresSafeArea())
        }
    }
    
    func deleteFoods(food: Food) {
        if let index = sharedData.cartFoods.firstIndex(where: { currentFood in
            return food.id == currentFood.id
        }) {
            let _ = withAnimation {
                sharedData.cartFoods.remove(at: index )
            }
        }
    }
    
    func qualityFoodInCart() {
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(SharedDetailViewModel())
    }
}


