//
//  TenantResponse.swift
//  Tenant
//
//  Created by Steven Frio on 7/26/23.
//
import Foundation

// MARK: - Tenant
struct TenantResponse: Codable, Hashable {
    let id: Int
    let createdAt, name: String
    let type: String
    let x, y, width, height: Float
    let tenantCode: String

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case name, type, x, y, width, height
        case tenantCode = "tenant_code"
    }
}

typealias Tenants = [TenantResponse]

