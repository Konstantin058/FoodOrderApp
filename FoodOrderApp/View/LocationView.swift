//
//  LocationView.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 08.06.2023.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        
        HStack(spacing: 150) {
            
            HStack {
                
                Button(action: {}) {
                    Image(systemName: "location")
                        .foregroundColor(.purple)
                    
                    Text("Краснодар")
                        .foregroundColor(.purple)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bell")
                        .foregroundColor(.purple)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
