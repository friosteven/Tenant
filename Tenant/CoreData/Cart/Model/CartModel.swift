//
//  CartModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/7/24.
//

import Foundation
import CoreData

struct CartModel: Identifiable {
    var id: UUID
    var productID: Int
    var productName: String
    var unitPrice: Float
    var storeID: Int
    var quantity: Int
    var imageURL: String
}
