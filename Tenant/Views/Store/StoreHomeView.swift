//
//  StoreHomeView.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import SwiftUI

struct StoreHomeView: View {
    @State private var categories: [String] = []

    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]

    @StateObject private var viewModel = StoreHomeViewModel()
    @State private var goToNextScreen = false
    var tenantID: Int

    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    categoriesView()
                    featuredItemsView()
                }
            }.padding(16)
        .onAppear(perform: {
            if tenantID == Constant.fakeStoreTenantID {
                viewModel.initFakeStore()
            }
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
        StoreHomeView(tenantID: 0)
    }
}
