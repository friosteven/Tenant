//
//  Resource.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import Foundation

struct Resource: Codable, Equatable {
    let id: Int
    let imageURL: String
    let description, createdAt: String
    let imageWidth: Float
    let imageHeight: Float

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case description
        case createdAt = "created_at"
        case imageWidth = "image_width"
        case imageHeight = "image_height"
    }
}
