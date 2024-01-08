//
//  StoreHomeViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

@MainActor
class StoreHomeViewModel: ObservableObject {
    @Published private var service = FakeStoreService()

    @Published var productsArr: Products = []
    @Published var productsWithLimitArr: Products = []

    @Published var categories: [String]? = []

    func getProducts() {
        Task {
            do {
                let result = await self.service.sendRequest(
                    endpoint: FakeStoreEndpoint.getFakeStoreProducts,
                    responseModel: FakeStoreOutputModel.self
                )
                var value = try result.get()
                self.productsArr = value.map { data in
                    data.toProduct()
                }
            }
        }
    }

    func getProductsWithLimit(limit: Int) {
        Task {
            do {
                let result = await self.service.sendRequest(
                    endpoint: FakeStoreEndpoint.getFakeStoreProductsWithLimit(limit: limit),
                    responseModel: FakeStoreOutputModel.self
                )
                var value = try result.get()
                self.productsWithLimitArr = value.map { data in
                    data.toProduct()
                }
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
}
