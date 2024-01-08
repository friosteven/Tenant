//
//  FakeStoreOutputModel.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

struct ProductsInputModel: Codable {
    let limit: Int
}

// model based on fakestore api response
struct FakeStoreOutputModelElement: Codable, Identifiable {
    let uuid = UUID()
    let id: Int?
    let title: String?
    let price: Float?
    let productDescription, category: String?
    let image: String?
    let rating: Rating
    let tenantID: Int = 64

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case productDescription = "description"
        case category, image, rating
    }
}

extension FakeStoreOutputModelElement {
    func toProduct() -> Product {
        let tenantID = 64
        let productCode = "\(tenantID)\(self.id ?? 0)"

        return Product(id: self.id ?? 0,
                             productName: self.title ?? "",
                             unitPrice: self.price,
                             productDescription: self.productDescription,
                             category: self.category,
                             productCode: productCode,
                             isAvailable: true,
                             hasQuantity: true,
                             quantity: 100,
                             imageURL: self.image,
                             tenantID: tenantID)
    }
}

// MARK: - Rating

struct Rating: Codable {
    let rate: Float?
    let count: Int?
}

typealias FakeStoreOutputModel = [FakeStoreOutputModelElement]
