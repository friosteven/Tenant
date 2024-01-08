//
//  FakeStoreService.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

protocol FakeStoreServicesProtocol {
    func getFakeStoreProducts() async -> Result<FakeStoreOutputModel, RequestError>
    func getFakeStoreProductsWithLimit(limit: Int) async -> Result<FakeStoreOutputModel, RequestError>
    func getFakeStoreCategories() async -> Result<[String], RequestError>
}

struct FakeStoreService: HTTPClient, FakeStoreServicesProtocol {
    func getFakeStoreProducts() async -> Result<FakeStoreOutputModel, RequestError> {
        return await sendRequest(endpoint: FakeStoreEndpoint.getFakeStoreProducts, responseModel: FakeStoreOutputModel.self)
    }
    func getFakeStoreProductsWithLimit(limit: Int) async -> Result<FakeStoreOutputModel, RequestError> {
        return await sendRequest(endpoint: FakeStoreEndpoint.getFakeStoreProductsWithLimit(limit: limit), responseModel: FakeStoreOutputModel.self)
    }
    func getFakeStoreCategories() async -> Result<[String], RequestError> {
        return await sendRequest(endpoint: FakeStoreEndpoint.getFakeStoreCategories, responseModel: [String].self)
    }
}
