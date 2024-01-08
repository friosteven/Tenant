//
//  CartView.swift
//  Tenant
//
//  Created by John Steven Frio on 10/19/23.
//

import SwiftUI

struct CartView: View {

    @StateObject var cartVM = CartViewModel()
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(cartVM.cartItems, id: \.uuid) { cartItem in
                    CustomCellView(product: cartItem.toProductModel(),
                                   style: .favorites)
                }
            }
        }
        .onAppear(perform: {
            cartVM.getCartItems()
        })
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
