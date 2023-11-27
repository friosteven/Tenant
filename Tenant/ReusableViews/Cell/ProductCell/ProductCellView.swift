//
//  ProductCellView.swift
//  Tenant
//
//  Created by John Steven Frio on 11/27/23.
//

import Kingfisher
import SwiftUI

struct ProductCellView: View {
    var productDetails: ProductsOutputModelElement?
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            KFImage(URL(string: productDetails?.image ?? ""))
                .resizable()
                .scaledToFit()
                .frame(height: 120)
            Text(productDetails?.title ?? "")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            HStack {
                Text("$\(productDetails?.price?.description ?? "")")
                //                Image("")
            }
        }
        .padding(EdgeInsets(top: 8,
                            leading: 4,
                            bottom: 8,
                            trailing: 4))
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView()
    }
}
