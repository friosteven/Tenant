//
//  CartView.swift
//  Tenant
//
//  Created by John Steven Frio on 10/19/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart
    var body: some View {
        VStack {
            List(cart.cart, id: \.uuid) {
                CustomCellView(product: modelHelper(using: $0), style: .favorites)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(Cart())
    }
}

extension CartView {
    func modelHelper(using cartModel: CartModel) -> ProductsOutputModelElement {
        ProductsOutputModelElement(id: cartModel.id,
                                   title: cartModel.title,
                                   price: cartModel.price,
                                   productDescription: cartModel.productDescription,
                                   category: cartModel.category,
                                   image: cartModel.image,
                                   rating: Rating(rate: 0, count: 0))
    }
}
