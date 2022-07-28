//
//  UserModel.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import Foundation

struct UserModel: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let gender: String
    let age: String
}
