//
//  TenantCompanionViewModel.swift
//  Tenant
//
//  Created by Steven Frio on 10/22/23.
//

import Foundation


class TenantCompanionViewModel: ObservableObject {

    @Published private var service = TenantService()
    @Published var addTenantMessage = ""
    @Published var showAlert = false
    

    func addTenant(request: AddTenantRequest) {
        Task {
            do {
                let result = try await service.sendRequest(
                    endpoint: TenantEndpoint.addTenant(request: request),
                    responseModel: AddTenantResponse.self)

                addTenantMessage = try result.get().message
                showAlert = true
            }
        }
    }

//    func getConvertedFigmaToSupabaseValues(request: AddTenantRequest) -> AddTenantRequest {
//        let imageWidth: Float = 499.84
//        let imageHeight: Float = 695.22
//
//
//        let convertedXString = String(format: "%.5f", request.x / imageWidth)
//        let convertedYString = String(format: "%.5f", request.y / imageHeight)
//        let convertedWidthString = String(format: "%.5f", request.width / imageHeight)
//        let convertedHeightString = String(format: "%.5f", request.height / imageHeight)
//
//
//        print("x \(convertedXString), y \(convertedYString), width \(convertedWidthString), height \(convertedHeightString), name \(request.name), type \(request.type)")
//        return AddTenantRequest(name: "",
//                                type: "Mall",
//                                x: Float(convertedXString) ?? 0.0,
//                                y: Float(convertedYString) ?? 0.0,
//                                width: Float(convertedWidthString) ?? 0.0,
//                                height: Float(convertedHeightString) ?? 0.0)
//    }

    func getFloorPlanImageWidthAndHeight() -> (width: Float, height: Float) {
        return (width: UserDefaultsWrapper.floorPlanWidth, height: UserDefaultsWrapper.floorPlanHeight )
    }

    func setFloorPlanImageWidthAndHeight(width: Float, height: Float) {
        UserDefaultsWrapper.floorPlanWidth = width
        UserDefaultsWrapper.floorPlanHeight = height
    }
}
