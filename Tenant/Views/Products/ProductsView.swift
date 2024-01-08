//
//  ProductsView.swift
//  Tenant
//
//  Created by John Steven Frio on 10/13/23.
//

import CoreData
import Kingfisher
import SwiftUI

struct UserInformation {
    var email: String = ""
    var password: String = ""
}

struct ProductsView: View {
    //    @State private var email: String = ""
    //    @State private var password: String = ""
    //
    @State private var presentAlert = false
    @State private var productQuantity = ""
    @State private var searchKeyword = ""
    @State private var products: Products = .init()
    private var filteredResults: Products {
        if searchKeyword.isEmpty {
            return products
        } else {
            return products.filter { ($0.productName ).contains($searchKeyword.wrappedValue)
            }
        }
    }

    var body: some View {
        NavigationView {
            //            VStack {
            //                Button(action: {
            //                    presentAlert = true
            //                    CustomAlert().alert("", isPresented: $presentAlert, actions: {})
            //                }) {
            //                    HStack {
            //                        HStack {
            //                            Text("Sort & Filter")
            //                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
            //                        }
            //                    }
            //                }
            //                List(filteredResults, id: \.uuid) { product in
            //                    ZStack {
            //                        NavigationLink(destination: ProductDetailsView(productDetails: product), label: {
            //                            EmptyView()
            //                        })
            //                        .opacity(0.0)
            //                        .cornerRadius(8)
            //
            //                        CustomCellView(product: product, style: .light)
            //                    }
            //                }
            //                .searchable(text: $searchKeyword)
            //            }
            VStack {
                CustomButton(customButtonType: .sortFilter,
                             rightImage: "sort_filter",
                             didTap: {})
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                List(filteredResults, id: \.uuid) { product in
                    NavigationLink(destination: ProductDetailsView(productDetails: product), label: {
                        //                            EmptyView()
                        CustomCellView(product: product, style: .normal)
                    })
                }.searchable(text: $searchKeyword)
            }
            .navigationTitle(Text("Products"))
            .onAppear(perform: getData)
        }
    }
}


extension ProductsView {
    private func getData() {
//        NetworkManager().fetchProducts(completion: { result in
//            switch result {
//            case let .success(response):
//                self.fakeStoreModel = response
//                print(response)
//            case let .failure(error):
//                print(error.localizedDescription)
//            }
//        })
    }
}

extension ProductsView {
//    func filterButton() -> some View {
//        return Button(action: {
//            presentAlert = true
//            CustomAlert().alert("", isPresented: $presentAlert, actions: {})
//        }) {
//            HStack {
//                HStack {
//                    Text("Sort & Filter")
//                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
//                }
//            }
//        }
//
//    }
}
