//
//  CartViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/6/24.
//

import Foundation
import SwiftUI

@MainActor
class CartViewModel: ObservableObject {

    @Published var cartItems: [CartModel] = []
    @ObservedObject var cartCDManager = CartCDManager()

    func getCartItems() {
        cartCDManager.readItems()
        cartItems = cartCDManager.cartItems
    }

    func saveToCart(product: Product) {
        let cart = CartModel(
            id: product.id,
            productName: product.productName ,
            productCode: "",
            unitPrice: product.unitPrice ?? 0,
            tenantID: 0,
            quantity: 1,
            imageURL: product.imageURL ?? "")

        cartCDManager.saveItem(item: cart)
        cartCDManager.readItems()
    }
}
