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

    @StateObject var tabViewState = TabViewState()
    var body: some Scene {
        WindowGroup {
            CustomTab()
                .environmentObject(tabViewState)
        }
    }
}
