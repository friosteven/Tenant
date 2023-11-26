//
//  HomeView.swift
//  Tenant
//
//  Created by Steven Frio on 10/7/23.
//

import SwiftUI

struct HomeView: View {
    @State private var goToTenantMap = false
    @State private var goToTenantCompanion = false
    @State private var homeNavigationEnum: HomeNavigationEnum = .tenantMap
    @EnvironmentObject var appStateContainer: AppStateContainer
    
    var body: some View {
        NavigationView(content: {
            VStack {
                NavigationLink(destination: FloorPlanView(),
                               isActive: $goToTenantMap) {
                    Button(HomeNavigationEnum.tenantMap.title,
                           action: {
                        homeNavigationEnum = .tenantMap
                        goToTenantMap.toggle()
                    })
                }
                NavigationLink(destination: TenantCompanion(),
                               isActive: $goToTenantCompanion) {
                    Button(HomeNavigationEnum.tenantCompanion.title,
                           action: {
                        homeNavigationEnum = .tenantCompanion
                        goToTenantCompanion.toggle()
                    })
                }
            }
            .navigationTitle(homeNavigationEnum.title)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
