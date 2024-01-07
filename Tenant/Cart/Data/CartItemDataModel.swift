//
//  CartItemDataModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/7/24.
//

import Foundation
import CoreData

struct CartItemDataModel {
    let cartEntity: CartEntity

    var id: NSManagedObjectID {
        return cartEntity.objectID
    }

    var productName: String {
        return cartEntity.productName ?? ""
    }

    var productID: Int {
        return Int(cartEntity.productID)
    }

    var imageURL: String {
        return cartEntity.imageURL ?? ""
    }

    var unitPrice: Float {
        return cartEntity.unitPrice
    }

    var quantity: Int {
        return Int(cartEntity.quantity)
    }

    var storeID: Int {
        return Int(cartEntity.storeID)
    }
}
