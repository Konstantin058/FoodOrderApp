//
//  MainView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 06.06.2023.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: Tab = .home
    var foods: [Food] = []
    @StateObject var sharedData: SharedDetailViewModel = SharedDetailViewModel()
    @Namespace var animation

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
               HomeView()
                    .tag(Tab.home)
                
                LikedView()
                    .environmentObject(sharedData)
                    .tag(Tab.liked)
                
                MenuView(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.menu)
                
                CartView()
                    .environmentObject(sharedData)
                    .tag(Tab.cart)
                    .overlay {
                        if foods.count > 0 {
                            badge("5")
                        }
                    }
                
                ProfileView()
                    .tag(Tab.profile)
                
            }
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button(action: {
                        currentTab = tab
                    }) {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color.red : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color("Bg").ignoresSafeArea())
        .overlay {
            
            ZStack {
                
                if let food = sharedData.detailFood, sharedData.showDetailFood {
                    
                    FoodDetailView(food: food, animation: animation)
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

enum Tab: String, CaseIterable {
    case home = "home"
    case liked = "liked"
    case menu = "menu"
    case cart = "cart"
    case profile = "user"
}
