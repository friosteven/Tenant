//
//  CartView.swift
//  Tenant
//
//  Created by John Steven Frio on 10/19/23.
//

import SwiftUI

struct CartView: View {

    @StateObject var cartDMVM = CartCDManagerViewModel()
    
    var body: some View {

        VStack {
            ForEach(cartDMVM.cartItems, id: \.id) { cartItem in
                CustomCellView(product: modelHelper(using: cartItem), style: .favorites)
            }
        }
        .onAppear(perform: {
            cartDMVM.readItems()
        })
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

extension CartView {
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
