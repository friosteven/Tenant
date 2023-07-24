//
//  APP_SECRETS.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation


//https://medium.com/swift-india/secure-secrets-in-ios-app-9f66085800b4
struct APP_SECRETS {
    static let apikey = Bundle.main.infoDictionary?["API_KEY"] as! String
}
