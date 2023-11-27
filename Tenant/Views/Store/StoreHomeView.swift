//
//  StoreHomeView.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import SwiftUI

struct StoreHomeView: View {
    @State private var categories: [String] = []

    @State private var productsModel: ProductsOutputModel = .init()
    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]

    @StateObject private var viewModel = StoreHomeViewModel()
    @State private var products = ProductsOutputModel.self
    @State private var goToNextScreen = false



    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    categoriesView()
                    featuredItemsView()
                }
            }.padding(16)
        .onAppear(perform: {
            viewModel.getCategories()
            viewModel.getProductsWithLimit(limit: 5)
        })
    }
}

extension StoreHomeView {
    func categoriesView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Categories").font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.categories ?? [], id: \.self) { data in
                        NavigationLink(destination: StoreMainView(selectedCategoryValue: data),
                                       label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray)
                                CategoriesCell(title: data)
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                            .frame(width: 320, height: 120)
                        })
                    }
                }
            }
        }
    }

    func featuredItemsView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Featured Items").font(.headline)
                Spacer()

                NavigationLink(destination: StoreMainView(),
                               label: {
                    Text("See All Products")
                        .font(.subheadline)
                })
            }
            ProductGridView(products: viewModel.productsWithLimitArr)
        }
    }
}

struct StoreHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StoreHomeView()
    }
}
