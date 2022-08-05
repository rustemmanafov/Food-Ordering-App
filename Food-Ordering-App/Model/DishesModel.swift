//
//  DishesModel.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import Foundation

struct DishesModel: Codable {
    let id: String
    let name: String
    let image: String
    let count: String
    let description: String
    let price: String
}
