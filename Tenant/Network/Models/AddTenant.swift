//
//  AddTenant.swift
//  Tenant
//
//  Created by Steven Frio on 10/22/23.
//

import Foundation
struct AddTenantRequest: Encodable {
    let name_input: String
    let type_input: String
    let x_input, y_input, width_input, height_input: Float
}

struct AddTenantResponse: Codable {
    let message: String
}
