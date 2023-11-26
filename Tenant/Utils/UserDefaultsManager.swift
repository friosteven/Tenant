//
//  UserDefaultsManager.swift
//  Tenant
//
//  Created by Steven Frio on 10/25/23.
//

import Foundation

@propertyWrapper
struct UserDefaultsManager<T> {
    private let key: String
    private let value: T

    init(key: String, value: T) {
        self.key = key
        self.value = value
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

// USAGE: for getting values: print(UserDefaulsWrapper.isDontShowOfficeDetailsModalAgainChecked)
//        for storing bools: UserDefaultsWrapper.isDontShowOfficeDetailsModalAgainChecked = false
//        for storing Strings: UserDefaultsWrapper.isDontShowOfficeDetailsModalAgainChecked = "Your String value"

enum UserDefaultsWrapper {
    @UserDefaultsManager(key: UserDefaultsKey.floorPlanWidth, value: 499.84)
    static var floorPlanWidth: Float

    @UserDefaultsManager(key: UserDefaultsKey.floorPlanHeight, value: 695.22)
    static var floorPlanHeight: Float
}

enum UserDefaultsKey {
    static let floorPlanHeight = "floorPlanHeight"
    static let floorPlanWidth = "floorPlanWidth"
}
