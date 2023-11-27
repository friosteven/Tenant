//
//  CustomTab.swift
//  Tenant
//
//  Created by Steven Frio on 10/21/23.
//

import SwiftUI

struct CustomTab: View {
    @EnvironmentObject var tabViewState: TabViewState
    var body: some View {
        TabView(selection: $tabViewState.selectedTab) {
            FloorPlanView()
                .tabItem({
                    Label("Home", systemImage: "house.fill")
                })
                .tag(Tab.home)
            TenantCompanion()
//            SettingsView()
                .tabItem({
                    Label("Settings", systemImage: "gearshape")
                })
                .tag(Tab.settings)
        }

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTab()
    }
}
