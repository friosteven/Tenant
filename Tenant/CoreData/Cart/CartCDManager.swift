//
//  CartCDManager.swift
//  Tenant
//
//  Created by Steven Frio on 1/6/24.
//

import Foundation
import CoreData
import SwiftUI

//should only be used by viewmodels
class CartCDManager: ObservableObject {

    @Published var cartItems: [CartModel] = []

    func readItems() {
        let data = CoreDataManager.shared.readData().map(CartCDModel.init)
        cartItems = data.map { value in
            CartModel(id: value.id,
                      productName: value.productName,
                      productCode: value.productCode,
                      unitPrice: value.unitPrice,
                      tenantID: value.tenantID,
                      quantity: value.quantity,
                      imageURL: value.imageURL)
        }
    }

    func saveItem(item: CartModel) {
        let cart = CartEntity(context: CoreDataManager.shared.viewContext)

        cart.imageURL = item.imageURL
        cart.unitPrice = Float(item.unitPrice)
        cart.quantity = Int16(item.quantity)
        cart.tenantID = Int16(item.tenantID)
        cart.productName = item.productName
        
        CoreDataManager.shared.saveData()

    }
}
