//
//  Products.swift
//  Tenant
//
//  Created by Steven Frio on 1/8/24.
//

import Foundation

// model based on supabase/products table
struct ProductsOutputModelElement: Codable, Identifiable {
    let id: Int?
    let productName: String
    let unitPrice: Float?
    let productDescription, category: String?
    let productCode: String
    let isAvailable, hasQuantity: Bool
    let quantity: Int?
    let imageURL: String?
    let tenantID: Int

    enum CodingKeys: String, CodingKey {
        case id, quantity, category
        case unitPrice = "unit_price"
        case productName = "product_name"
        case productDescription = "description"
        case productCode = "product_code"
        case isAvailable = "is_available"
        case hasQuantity = "has_quantity"
        case tenantID = "tenant_id"
        case imageURL = "image_url"
    }
}

typealias ProductsOutputModel = [ProductsOutputModelElement]
