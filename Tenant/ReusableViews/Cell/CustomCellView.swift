//
//  CustomCellView.swift
//  Tenant
//
//  Created by John Steven Frio on 11/27/23.
//

import Kingfisher
import SwiftUI

struct CustomCellView: View {
    var product: Product?
    var style: CustomCellViewStyle? = .normal

    var body: some View {
        ZStack {
//            NavigationLink(destination: ProductDetailsView(productDetails: product), label: {
//                EmptyView()
//            })
//            .opacity(0.0)
//            .cornerRadius(8)

            GeometryReader { geometry in
                HStack {
                    KFImage(URL(string: product?.imageURL ?? ""))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .frame(width: geometry.size.width / 3)
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(product?.productName ?? "")
                            .font(Font.custom("Poppins-Bold", size: 16))
                        Spacer()
                        HStack {
                            Text("$\(product?.unitPrice?.description ?? "")")
                                .font(Font.custom("Poppins-Bold", size: 14))
                                .foregroundColor(.red)
                            Spacer()

//                            if style == .normal {
//                                HStack {
//                                    Text(product?.rating.count?.description ?? "")
//                                        .font(Font.custom("Poppins-Bold", size: 14))
//                                    Image(systemName: "eye")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 16, height: 16)
//                                }
//                            }
                        }
                        Spacer()
                    }
                }
            }
            .frame(height: 120)
        }
        .listRowSeparator(.hidden)
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellView()
    }
}

extension CustomCellView {
    enum CustomCellViewStyle {
        case normal
        case favorites
        case cart
//        var background: Color {
//            switch self {
//            case .normal:
//                return .gray
//            case .favorites:
//                return .white
//
//        }
    }
}
