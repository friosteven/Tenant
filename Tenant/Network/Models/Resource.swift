//
//  Resource.swift
//  Tenant
//
//  Created by Steven Frio on 7/3/23.
//

import Foundation

struct Resource: Codable {
    let id: Int
    let imageURL: String
    let description, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case description
        case createdAt = "created_at"
    }
}
