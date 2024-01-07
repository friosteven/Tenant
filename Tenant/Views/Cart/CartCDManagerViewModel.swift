//
//  CartCDManagerViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/6/24.
//

import Foundation
import CoreData

@MainActor
class CartCDManagerViewModel: ObservableObject {

    @Published var cartItems: [CartItemDataModel] = []

    func readItems() {
        cartItems = CartCDManager.shared.readAllData().map(CartItemDataModel.init)
    }

    func saveItem(item: CartItemDomainModel) {
        let cart = CartEntity(context: CartCDManager.shared.viewContext)

        cart.imageURL = item.imageURL
        cart.unitPrice = Float(item.unitPrice)
        cart.quantity = Int16(item.quantity)
        cart.storeID = Int16(item.storeID)
        cart.productName = item.productName

        CartCDManager.shared.saveData()

    }
}
