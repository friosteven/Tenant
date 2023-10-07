//
//  HomeNavigationEnum.swift
//  Tenant
//
//  Created by Steven Frio on 10/7/23.
//

import Foundation


enum HomeNavigationEnum {
    case tenantMap
    case tenantCompanion

    var title: String {
        switch self {
        case .tenantMap:
            return "Tenant Map"
        case .tenantCompanion:
            return "Tenant Companion"
        }
    }
}
