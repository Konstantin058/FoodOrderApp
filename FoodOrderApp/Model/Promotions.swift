//
//  Promotions.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 08.06.2023.
//

import Foundation
import SwiftUI

struct Promotions: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var image: String
}
