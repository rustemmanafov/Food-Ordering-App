//
//  RestaurantModel.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import Foundation

struct RestaurantModel: Codable {
    
    let id: Int
    let name: String
    let image: String
    let description: String
    let coordinatex: String
    let coordinatey: String
    let dishes: [DishesModel]
}
