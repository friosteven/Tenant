//
//  TenantApp.swift
//  Tenant
//
//  Created by Steven Frio on 7/2/23.
//

import SwiftUI

@main
struct TenantApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            FloorPlanView()
        }
    }
}
