//
//  AppDelegate.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import Foundation
import UIKit
import netfox

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        NFX.sharedInstance().start()
        return true
    }
}
