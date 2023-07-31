//
//  FloorPlanViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import Foundation

@MainActor
class FloorPlanViewModel: ObservableObject {

    @Published var service = HomeService()
    @Published var resourceArr: [Resource] = []
    @Published var tenantArr: [Tenant]? = []

    func getImageURL() {

        Task {
            do {
                let result = await service.sendRequest(
                    endpoint: HomeEndpoint.getImageURL,
                    responseModel: [Resource].self
                )
                self.resourceArr = try result.get()
                print("val-resourceArr: \(self.resourceArr)")
            }
        }
    }

    func getTenant() {
        Task {
            do {
                let result = await service.sendRequest(
                    endpoint: HomeEndpoint.getTenant,
                    responseModel: [Tenant].self
                )
                self.tenantArr = try result.get()
                print("val-tenantArr: \(self.tenantArr)")
            }
        }
    }
}

