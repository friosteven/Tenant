//
//  CartCDManager.swift
//  Tenant
//
//  Created by Steven Frio on 1/6/24.
//

import Foundation
import CoreData


//should only be used by viewmodels
class CartCDManager: ObservableObject {

    func readItems() -> [CartModel] {
        let data = CoreDataManager.shared.readAllData().map(CartCDModel.init)

        return data.map { value in
            CartModel(id: UUID(),
                      productID: value.productID,
                      productName: value.productName,
                      unitPrice: value.unitPrice,
                      storeID: value.storeID,
                      quantity: value.quantity,
                      imageURL: value.imageURL)
        }
    }

    func saveItem(item: CartModel) {
        let cart = CartEntity(context: CoreDataManager.shared.viewContext)

        cart.imageURL = item.imageURL
        cart.unitPrice = Float(item.unitPrice)
        cart.quantity = Int16(item.quantity)
        cart.storeID = Int16(item.storeID)
        cart.productName = item.productName

        CoreDataManager
            .shared.saveData()

    }
}
