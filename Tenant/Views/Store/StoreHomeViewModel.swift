//
//  StoreHomeViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

@MainActor
class StoreHomeViewModel: ObservableObject {
    @Published var service = FakeStoreService()
    @Published var productsArr: ProductsOutputModel = []
   
    @Published var productsWithLimitArr: ProductsOutputModel = []
    @Published var categories: [String]? = []

    func getProducts() {
        Task {
            do {
                let result = await self.service.sendRequest(
                    endpoint: FakeStoreEndpoint.getFakeStoreProducts,
                    responseModel: ProductsOutputModel.self
                )
                self.productsArr = try result.get()
            }
        }
    }

    func getProductsWithLimit(limit: Int) {
        Task {
            do {
                let result = await self.service.sendRequest(
                    endpoint: FakeStoreEndpoint.getFakeStoreProductsWithLimit(limit: limit),
                    responseModel: ProductsOutputModel.self
                )
                self.productsWithLimitArr = try result.get()
            }
        }
    }

    func getCategories() {

        Task {
            do {
                let result = await service.sendRequest(
                    endpoint: FakeStoreEndpoint.getFakeStoreCategories,
                    responseModel: [String].self
                )
                self.categories = try result.get()
            }
        }
    }

    func getAllCategories() {

        Task {
            do {
                let result = await service.sendRequest(
                    endpoint: FakeStoreEndpoint.getFakeStoreCategories,
                    responseModel: [String].self
                )
                self.categories = try result.get()
                self.categories?.insert("All", at: 0)
            }
        }
    }

//    func setFilteredProductsArrByCategory() -> ProductsOutputModel {
//
//        return viewModel.productsArr.filter { ($0.title?.lowercased() ?? "").contains($keyword.wrappedValue.lowercased()) }
//    }
}
