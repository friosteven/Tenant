//
//  ProductGridView.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import SwiftUI

struct ProductGridView: View {
    var products: Products
    @State private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(products, id: \.id) { data in
                    ZStack {
                        NavigationLink(destination: ProductDetailsView(productDetails: data), label: {
                            ProductCellView(productDetails: data)
                        })
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    }.frame(height: 200)
                }
            }
        }
    }
}
