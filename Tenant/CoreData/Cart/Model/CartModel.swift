//
//  CartModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/7/24.
//

import Foundation
import CoreData

struct CartModel: Identifiable {
    var uuid = UUID()
    var id: Int
    var productName: String
    var productCode: String
    var unitPrice: Float
    var tenantID: Int
    var quantity: Int
    var imageURL: String
}

extension CartModel {
    func toProductModel() -> Product {
        return Product(id: self.id,
                       productName: self.productName,
                       unitPrice: self.unitPrice,
                       productDescription: "",
                       category: "",
                       productCode: self.productCode,
                       isAvailable: true,
                       hasQuantity: true,
                       quantity: self.quantity,
                       imageURL: self.imageURL,
                       tenantID: self.tenantID)
    }
}
