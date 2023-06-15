//
//  InfoModel.swift
//  FoodOrderApp
//
//  Created by Константин Евсюков on 09.06.2023.
//

import Foundation
import SwiftUI

struct InfoModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var image: String
}
