//
//  LikedView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 07.06.2023.
//

import SwiftUI

struct LikedView: View {
    
    @EnvironmentObject var sharedData: SharedDetailViewModel
    
    @State var showDeleteItem = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    HStack {
                        
                        Text("Избранное")
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
                    
                    if sharedData.likedFoods.isEmpty {
                        Group {
                            Image("noLiked")
                                .resizable()
                                .scaledToFit()
                                
                            
                            Text("Нет избранных вкусняшек))")
                                .font(.custom("Montserrat-Bold", size: 20))
                                .fontWeight(.semibold)
                            
                            Text("Выбирете пожалуйста понравившийся вам продукт и нажми скорее на кнопку лайк")
                                .font(.custom("Montserrat-Light", size: 17))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top, 10)
                                .multilineTextAlignment(.center)
                        }
                    } else {
                        VStack(spacing: 15) {
                            
                            ForEach(sharedData.likedFoods) { food in
                                
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
                                    cardView(food: food)
                                }
                            }
                        }
                        .padding(.top, 25)
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Bg").ignoresSafeArea())
        }
    }
    
    @ViewBuilder
    func cardView(food: Food) -> some View {
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
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    func deleteFoods(food: Food) {
        if let index = sharedData.likedFoods.firstIndex(where: { currentFood in
            return food.id == currentFood.id
        }) {
            let _ = withAnimation {
                sharedData.likedFoods.remove(at: index )
            }
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
            .environmentObject(SharedDetailViewModel())
    }
}
