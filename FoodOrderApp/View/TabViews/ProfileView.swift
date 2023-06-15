//
//  ProfileView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 06.06.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Text("Мой Профиль")
                        .font(.custom("Montserrat-Bold", size: 25))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15) {
                        
                        Image("avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipShape(Capsule())
                        
                        Text("Константин")
                            .font(.custom("Montserrat-Bold", size: 25))
                            .fontWeight(.semibold)
                    }
                    .padding([.horizontal, .bottom])
                    .background(Color.red.opacity(0)
                        .cornerRadius(25)
                    )
                    .padding()
                    .padding(.top, 40)
                    
                    customNavLink(title: "Редактировать профиль") {
                        
                        Text("")
                            .navigationTitle("Редактировать профиль")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("Bg").ignoresSafeArea())
                    }
                    
                    customNavLink(title: "История заказов") {
                        
                        Text("")
                            .navigationTitle("История заказов")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("Bg").ignoresSafeArea())
                    }
                    
                    customNavLink(title: "Адрес доставки") {
                        
                        Text("")
                            .navigationTitle("Адрес доставки")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("Bg").ignoresSafeArea())
                    }
                    
                    customNavLink(title: "Карты") {
                        
                        Text("")
                            .navigationTitle("Карты")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("Bg").ignoresSafeArea())
                    }
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Bg").ignoresSafeArea())
        }
    }
    
    @ViewBuilder
    func customNavLink<Detail: View>(title: String, @ViewBuilder content: @escaping () -> Detail) -> some View {
        NavigationLink {
            content()
        } label: {
            
            HStack {
                
                Text(title)
                    .font(.custom("Montserrat-Bold", size: 18))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color("Bg")
                    .cornerRadius(10)
            )
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
