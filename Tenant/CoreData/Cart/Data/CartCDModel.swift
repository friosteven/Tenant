//
//  CartCDModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/7/24.
//

import Foundation
import CoreData

struct CartCDModel {
    let cartEntity: CartEntity

    var objectID: NSManagedObjectID {
        return cartEntity.objectID
    }

    var id: Int {
        return Int(cartEntity.id)
    }

    var productName: String {
        return cartEntity.productName ?? ""
    }

    var productCode: String {
        return cartEntity.productCode ?? ""
    }

    var unitPrice: Float {
        return cartEntity.unitPrice
    }

    var tenantID: Int {
        return Int(cartEntity.tenantID)
    }

    var quantity: Int {
        return Int(cartEntity.quantity)
    }

    var imageURL: String {
        return cartEntity.imageURL ?? ""
    }
}
