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

    @StateObject private var manager: CoreDataManager = CoreDataManager()

    @StateObject var tabViewState = TabViewState()
    var body: some Scene {
        WindowGroup {
            CustomTab()
                .environmentObject(tabViewState)
                .environment(\.managedObjectContext, manager.viewContext)
        }
    }
}
