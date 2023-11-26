//
//  AddTenant.swift
//  Tenant
//
//  Created by Steven Frio on 10/22/23.
//

import Foundation
struct AddTenantRequest {
    let name: String
    let type: String
    let x, y, width, height: Float
}

struct AddTenantResponse: Codable {
    let message: String
}
