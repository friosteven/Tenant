//
//  FloorPlanViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import Foundation

@MainActor
class FloorPlanViewModel: ObservableObject {

    @Published var service = TenantService()
    @Published var resourceArr: [Resource] = []
    @Published var tenantArr: [TenantResponse]? = []

    func getImageURL() {

        Task {
            do {
                let result = await service.sendRequest(
                    endpoint: TenantEndpoint.getImageURL,
                    responseModel: [Resource].self
                )
                self.resourceArr = try result.get()
            }
        }
    }

    func getTenant() {
        Task {
            do {
                let result = await service.sendRequest(
                    endpoint: TenantEndpoint.getTenant,
                    responseModel: [TenantResponse].self
                )
                self.tenantArr = try result.get()
            }
        }
    }
}

