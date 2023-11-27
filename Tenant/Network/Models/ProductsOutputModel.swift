//
//  ProductsOutputModel.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

struct ProductsInputModel: Codable {
    let limit: Int
}

struct ProductsOutputModelElement: Codable, Identifiable {
    let uuid = UUID()
    let id: Int?
    let title: String?
    let price: Double?
    let productDescription, category: String?
    let image: String?
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case productDescription = "description"
        case category, image, rating
    }
}

// MARK: - Rating

struct Rating: Codable {
    let rate: Double?
    let count: Int?
}

typealias ProductsOutputModel = [ProductsOutputModelElement]
