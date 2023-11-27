//
//  FakeStoreService.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

protocol FakeStoreServicesProtocol {
    func getFakeStoreProducts() async -> Result<ProductsOutputModel, RequestError>
    func getFakeStoreProductsWithLimit(limit: Int) async -> Result<ProductsOutputModel, RequestError>
    func getFakeStoreCategories() async -> Result<[String], RequestError>
}

struct FakeStoreService: HTTPClient, FakeStoreServicesProtocol {
    func getFakeStoreProducts() async -> Result<ProductsOutputModel, RequestError> {
        return await sendRequest(endpoint: FakeStoreEndpoint.getFakeStoreProducts, responseModel: ProductsOutputModel.self)
    }
    func getFakeStoreProductsWithLimit(limit: Int) async -> Result<ProductsOutputModel, RequestError> {
        return await sendRequest(endpoint: FakeStoreEndpoint.getFakeStoreProductsWithLimit(limit: limit), responseModel: ProductsOutputModel.self)
    }
    func getFakeStoreCategories() async -> Result<[String], RequestError> {
        return await sendRequest(endpoint: FakeStoreEndpoint.getFakeStoreCategories, responseModel: [String].self)
    }
}
