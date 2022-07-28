//
//  UserDefaults.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 25.07.22.
//

import Foundation

// For Onboarding page UserDefaults
extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
