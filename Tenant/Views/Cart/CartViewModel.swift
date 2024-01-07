//
//  CartViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 1/6/24.
//

import Foundation

@MainActor
class CartViewModel: ObservableObject {

    var cartCDManager = CartCDManager()

    @Published var cartItems: [CartModel] = []

    func getCartItems() {
        cartItems = cartCDManager.readItems()
    }

    func saveToCart(product: ProductsOutputModelElement) {
        let cart = CartModel(
            id: UUID(),
            productID: product.id ?? 0,
            productName: product.title ?? "",
            unitPrice: product.price ?? 0,
            storeID: product.id ?? 0,
            quantity: 1,
            imageURL: "")

        cartCDManager.saveItem(item: cart)
    }

    func modelHelper(using data: CartModel) -> ProductsOutputModelElement {
        return ProductsOutputModelElement(id: Int(data.productID),
                                   title: data.productName,
                                   price: data.unitPrice,
                                   productDescription: "",
                                   category: "",
                                   image: data.imageURL,
                                   rating: Rating(rate: 0, count: 0))
    }
}
