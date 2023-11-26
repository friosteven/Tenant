//
//  TabViewState.swift
//  Tenant
//
//  Created by Steven Frio on 10/21/23.
//

import Foundation
import SwiftUI

class TabViewState: ObservableObject {
    @Published var selectedTab: Tab = .home
}
