//
//  MenuViewModel.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 06.06.2023.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    
    @Published var foodCategory: FoodCategory = .burger
    
    @Published var foods: [Food] = [
        Food(foodCategory: .burger, title: "Беконатор", description: "с говяжьей котлетой, сырами чеддер и моцарелла и обжаренным беконом", price: "430 руб", foodImage: "bekonatorBurger"),
        Food(foodCategory: .burger, title: "Черный Вишня", description: "с говяжьей котлетой, сыром чеддер, беконом и пряной вишней", price: "380 руб", foodImage: "blackBurger"),
        Food(foodCategory: .burger, title: "Фирменный Бургер", description: "с 4 говяжьими котлетами, хрустящим луком, обжаренным беконом, сырами чеддер и моцарелла", price: "350 руб", foodImage: "firmenBurger"),
        Food(foodCategory: .burger, title: "Двойное счастье", description: "Аналог легендарного бургера в нашем исполнении. С соусом ремулад, двумя говяжьими котлетами, хрустящими овощами и сырами чеддер и моцарелла", price: "400 руб", foodImage: "doubleBurger"),
        Food(foodCategory: .burger, title: "Месть мясника", description: "с двойной говяжьей котлетой, сырами чеддер и моцареллой", price: "450 руб", foodImage: "mestMyasnikaBurg"),
        Food(foodCategory: .burger, title: "Большой Бум", description: "Трехкилограммовый классический бургер для Ваших мероприятий. Большая булочка, 2 огромных котлеты из мраморной говядины, сыры Чеддер и Моцарелла, овощи. *Заказ на данный бургер осуществляется за 24 часа в рабочее время", price: "1000 руб", foodImage: "bigBurger"),
        
        Food(foodCategory: .pizza, title: "Пепперони", description: "Пепперони, микс сыров, соус красный", price: "350 руб", foodImage: "peperoni"),
        Food(foodCategory: .pizza, title: "Маргарита", description: "Томаты, микс сыров, красный соус", price: "330 руб", foodImage: "margarita"),
        Food(foodCategory: .pizza, title: "Фирменная", description: "Говядина отварная, шампиньоны, красный соус, перец болгарский, сыр микс, вяленые томаты", price: "350 руб", foodImage: "firmennay"),
        Food(foodCategory: .pizza, title: "Куринная", description: "Куриное филе, салями, шампиньоны, перец болгарский, брокколи, сыр, соус белый", price: "320 руб", foodImage: "chickenPizza"),
        Food(foodCategory: .pizza, title: "Много сыра", description: "Дорблю, пармезан, голландский, моцарелла, белый соус", price: "350 руб", foodImage: "cheasePizza"),
        Food(foodCategory: .pizza, title: "4 сезона", description: "Пепперони, томаты, шампиньоны, бекон, сыр, фирменный соус", price: "350 руб", foodImage: "fourSeason"),
        
        Food(foodCategory: .rools, title: "Амаи", description: "Курица копчёная, сыр творожный, соус цезарь, томат, огурец, лист салата, тортилья (8 шт.)", price: "220 руб", foodImage: "amai"),
        Food(foodCategory: .rools, title: "Калифорния с лососем", description: "Лосось, майонез, авокадо, огурец, икра масаго, рис, нори (8 шт.)", price: "250 руб", foodImage: "califor"),
        Food(foodCategory: .rools, title: "Чикен Гриль", description: "Курица копчёная, бекон, сыр моцарелла, сыр голландский, соус гриль, сухари панко, рис, нори (8 шт.)", price: "210 руб", foodImage: "chickenGrill"),
        Food(foodCategory: .rools, title: "Филадельфия", description: "Креветка тигровая, сыр творожный, огурец, икра масаго, рис, нори (8 шт.)", price: "270 руб", foodImage: "phila"),
        Food(foodCategory: .rools, title: "Янаги", description: "Крабовая палочка, томаго, огурец, икра масаго, соус спайси, рис, нори (8 шт.)", price: "200 руб", foodImage: "yanagi"),
        Food(foodCategory: .rools, title: "Майли", description: "Креветка тигровая, сыр творожный, ананас, икра масаго, кунжут, рис, нори (8 шт.)", price: "215 руб", foodImage: "maiLi"),
        
        Food(foodCategory: .shaurma, title: "Фермерская", description: "Лаваш тонкий, свинина жареная, бекон, картофель фри, лук красный маринованный, огурцы консервированные, капуста пекинская, помидор, горчица дижонская, соус белый чесночный", price: "220 руб", foodImage: "shaurmaFermer"),
        Food(foodCategory: .shaurma, title: "Крабстер", description: "Лаваш тонкий, снежный краб (имитация), кукуруза, огурец свежий, помидор, сыр чеддер, соус спайси, соус белый чесночный", price: "230 руб", foodImage: "shaurmaKrab"),
        Food(foodCategory: .shaurma, title: "Мексиканская", description: "Лаваш тонкий, филе куриное жареное, капуста белокочанная, перец халапеньо, кукуруза, оливки, перец болгарский, соус острый, соус белый чесночный", price: "250 руб", foodImage: "shaurmaMexico"),
        Food(foodCategory: .shaurma, title: "Охотничья", description: "Лаваш тонкий, колбаски охотничьи, картофель фри, лук красный маринованный, огурцы консервированные, капуста пекинская, помидор, соус белый", price: "220 руб", foodImage: "shaurmaOxot"),
        Food(foodCategory: .shaurma, title: "Тропическая", description: "Лаваш тонкий, курица копченая, ананас, огурец свежий, капуста пекинская, сыр моцарелла, соус белый", price: "200 руб", foodImage: "shaurmaTropic"),
        Food(foodCategory: .shaurma, title: "Веганская", description: "Лаваш тонкий, картофель фри, шампиньоны, перец болгарский, капуста белокочанная, морковь по-корейски, огурцы консервированные, лук красный маринованный, соус красный", price: "180 руб", foodImage: "shaurmaVegan"),
    ]
    
    @Published var filteredFoods: [Food] = []
    
    init() {
        filterFoods()
    }
    
    func filterFoods() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.foods
                .lazy
                .filter { food in
                    return food.foodCategory == self.foodCategory
                }
            
            DispatchQueue.main.async {
                self.filteredFoods = results.compactMap({ food in
                    return food
                })
            }
        }
    }
}
