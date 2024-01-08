//
//  ProductDetailsView.swift
//  Tenant
//
//  Created by John Steven Frio on 10/18/23.
//

import Kingfisher
import SwiftUI

struct ProductDetailsView: View {
    var productDetails: Product?
//    @EnvironmentObject var cartItems: Cart
    //    @State private var trailingDesc = ""
    //    @State private var lineLimit: Int? = nil

//    @StateObject private var cartCDM = CartCDManager()
    
    @StateObject private var cartVM = CartViewModel()

    @State private var quantity: String = "0"
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                KFImage(URL(string: productDetails?.imageURL ?? ""))
                    //            KFImage(URL(string: productDetails?.image ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //            Text(productDetails?.title ?? "")
            }
            VStack(alignment: .leading) {
                /// Title
                Text(productDetails?.productName ?? L10n.Placeholder.title)
                    .font(Font.custom("Poppins-Bold", size: 16))
                /// Price
                HStack {
                    Text("$\(productDetails?.unitPrice?.description ?? "109")")
                        .font(Font.custom("Poppins-Bold", size: 20))
                        .foregroundColor(.red)
                        .padding(.top, 16)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
//                HStack {
//                    HStack {
//                        Text("Ratings: ")
//                            .font(Font.custom("Poppins-Bold", size: 16))
//                        Text(productDetails?.rating.rate?.description ?? "")
//                            .font(Font.custom("Poppins-Bold", size: 16))
//                    }
//                    Divider().frame(height: 16)
//                    HStack {
//                        Text(productDetails?.rating.count?.description ?? "")
//                            .font(Font.custom("Poppins-Bold", size: 16))
//                        Image(systemName: "eye")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 16, height: 16)
//                    }
//                    Spacer()
//                }
                Text(productDetails?.productDescription ?? L10n.Placeholder.details)
                    .font(Font.custom("Poppins-Bold", size: 16))
                    .padding(.top, 16)
                //                    .lineLimit($lineLimit.wrappedValue)
                //                Text($trailingDesc.wrappedValue)
                //                    .bold()
                //                    .onTapGesture {
                //                        readMoreReadLess()
                //                    }
            }
            .padding(.all, 16)
            Spacer()
            CustomButton(customButtonType: .addToCart, didTap: {
                if let productDetails = productDetails {
                    cartVM.saveToCart(product: productDetails)
                }
            })
        }
//        .environmentObject(cartItems)
        .onAppear(perform: {
            readMoreReadLess()
        })
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}

extension ProductDetailsView {

    func readMoreReadLess() {
        //        let textCount = productDetails?.productDescription?.count ?? 0
        //        trailingDesc = textCount > 30 ? "Read Less" : "Read More"
        //        lineLimit = textCount > 30 ? 2 : nil
        //        print(lineLimit)
        //
        //        if textCount > 30 {
        //            if trailingDesc == "Read More" && lineLimit == nil {
        //
        //            }
        //        }
        print("didPressedReadMore")
    }
}
