//
//  FoodDetailView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 07.06.2023.
//

import SwiftUI

struct FoodDetailView: View {
    var food: Food
    var animation: Namespace.ID
    
    @EnvironmentObject var shareData: SharedDetailViewModel
    @EnvironmentObject var menuData: MenuViewModel
    
    var body: some View {
        
        VStack {
            
            VStack{
                
                HStack {
                    
                    Button(action: {
                        withAnimation(.easeInOut) {
                            shareData.showDetailFood = false
                        }
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        addLiked()
                    }) {
                        Image("hearth")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .foregroundColor(isLiked() ? .red : .black.opacity(0.7))
                    }
                }
                .padding()
                
                Image(food.foodImage)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "\(food.id)IMAGE", in: animation)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: getRect().height / 2.7)
            .zIndex(1)
            
            ScrollView(.vertical, showsIndicators:  false) {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(food.title)
                        .font(.title)
                        .bold()
                    
                    Text(food.description)
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            Image(systemName: "arrow.right")
                        } icon: {
                            Text("Показать все")
                        }
                        .font(.footnote)
                        .foregroundColor(.purple)
                    }
                    
                    HStack {
                        
                        Text("Цена")
                            .font(.title2)
                        
                        Spacer()
                        
                        Text("\(food.price)")
                            .font(.title2)
                            .foregroundColor(.purple)
                    }
                    .padding(.vertical, 20)
                    
                    Button {
                        addCart()
                    } label: {
                        
                        Text("\(isAddCart() ? "В корзине" : "Заказать")")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(25)
                    }

                }
                .padding([.horizontal, .bottom], 20)
                .padding(.top, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .zIndex(0)
        }
        .animation(.easeInOut, value: shareData.likedFoods)
        .animation(.easeInOut, value: shareData.cartFoods)
        .background(Color("Bg"))
    }
    
    func isLiked() -> Bool {
        return shareData.likedFoods.contains { food in
            return self.food.id == food.id
        }
    }
    
    func isAddCart() -> Bool {
        return shareData.cartFoods.contains { food in
            return self.food.id == food.id
        }
    }
    
    func addLiked() {
        if let index = shareData.likedFoods.firstIndex(where: { food in
            return self.food.id == food.id
        }) {
            shareData.likedFoods.remove(at: index)
        } else {
            shareData.likedFoods.append(food)
        }
    }
    
    func addCart() {
        if let index = shareData.cartFoods.firstIndex(where: { food in
            return self.food.id == food.id
        }) {
            shareData.cartFoods.remove(at: index)
        } else {
            shareData.cartFoods.append(food)
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
