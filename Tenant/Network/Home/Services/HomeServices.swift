//
//  HomeServices.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation

protocol HomeServiceProtocol {
    func getImageURL() async -> Result<Resource, RequestError>
    func getTenant() async -> Result<Tenant, RequestError>
}

struct HomeService: HTTPClient, HomeServiceProtocol {
    func getImageURL() async -> Result<Resource, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getImageURL, responseModel: Resource.self)
    }
    func getTenant() async -> Result<Tenant, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getTenant, responseModel: Tenant.self)
    }
}
