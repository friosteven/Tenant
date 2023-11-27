//
//  FakeStoreEndpoint.swift
//  Tenant
//
//  Created by Steven Frio on 11/27/23.
//

import Foundation

enum FakeStoreEndpoint {
    case getFakeStoreProducts
    case getFakeStoreProductsWithLimit(limit: Int)
    case getFakeStoreCategories
}

extension FakeStoreEndpoint: Endpoint {

    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    var host: String {
        switch self {
        default:
            return HostEnvironment.fakeStore(env: .dev).getHostURL()
        }
    }

    var path: String {
        switch self {
        case .getFakeStoreProducts:
            return "/products"
        case .getFakeStoreCategories:
            return "/products/categories"
        case .getFakeStoreProductsWithLimit:
            return "/products"
        }
    }

    var method: RequestMethod {
        switch self {
        default:
            return .get
        }
    }

    var header: [String : String]? {
        switch self {
        default:
            return nil
        }
    }

    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }

    var query: [URLQueryItem]? {
        switch self {
        case .getFakeStoreProductsWithLimit(let limit):
            return [URLQueryItem(name: "limit", value: String(limit))]
        default:
            return []
        }
    }
}

