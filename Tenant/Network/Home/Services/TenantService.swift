//
//  HomeServices.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation

protocol TenantServicesProtocol {
    func getImageURL() async -> Result<Resource, RequestError>
    func getTenant() async -> Result<TenantResponse, RequestError>
    func addTenant(request: AddTenantRequest) async -> Result<AddTenantResponse, RequestError>
}

struct TenantService: HTTPClient, TenantServicesProtocol {
    func getImageURL() async -> Result<Resource, RequestError> {
        return await sendRequest(endpoint: TenantEndpoint.getImageURL, responseModel: Resource.self)
    }
    func getTenant() async -> Result<TenantResponse, RequestError> {
        return await sendRequest(endpoint: TenantEndpoint.getTenant, responseModel: TenantResponse.self)
    }
    func addTenant(request: AddTenantRequest) async -> Result<AddTenantResponse, RequestError> {
        return await sendRequest(endpoint: TenantEndpoint.addTenant(request: request), responseModel: AddTenantResponse.self)
    }
}
