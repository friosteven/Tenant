//
//  SettingsView.swift
//  Tenant
//
//  Created by Steven Frio on 10/21/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: TenantCompanion(), label: {
                Text("Tenant Companion")
            })
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
