//
//  CartModel.swift
//  Tenant
//
//  Created by John Steven Frio on 10/28/23.
//

import Foundation

class CartModel: Codable, Identifiable {
    var uuid = UUID()
    var id = 0
    var title = ""
    var price = 0.0
    var productDescription = ""
    var category = ""
    var image = ""
}

@MainActor class Cart: ObservableObject {
    @Published var cart: [CartModel]
    init() {
        cart = []
    }
}
