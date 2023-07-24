//
//  BaseResponseModel.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import Foundation


struct BaseResponseModel<T: Codable>: Codable {
    let id: Int
    let createdAt: String
    let data: T?
}
