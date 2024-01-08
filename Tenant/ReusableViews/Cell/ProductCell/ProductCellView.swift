//
//  ProductCellView.swift
//  Tenant
//
//  Created by John Steven Frio on 11/27/23.
//

import Kingfisher
import SwiftUI

struct ProductCellView: View {
    var productDetails: Product?
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                KFImage(URL(string: productDetails?.imageURL ?? ""))
                    .resizable()
                    .scaledToFit()

                RoundedRectangle(cornerRadius: 32)
                    .stroke(Color.gray, lineWidth: 0.3)
            }
            Text(productDetails?.productName ?? "")
                .style(size: 12)
                .multilineTextAlignment(.leading)
                .lineLimit(3)

            HStack {
                Text("$\(productDetails?.unitPrice?.description ?? "")").style(size: 16, color: .red)
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
