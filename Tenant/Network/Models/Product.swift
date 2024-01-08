//
//  ProductsModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/8/24.
//

import Foundation

typealias Products = [Product]

struct Product {
    var uuid = UUID()
    let id: Int
    let productName: String
    let unitPrice: Float?
    let productDescription, category: String?
    let productCode: String
    let isAvailable, hasQuantity: Bool
    let quantity: Int?
    let imageURL: String?
    let tenantID: Int
}
