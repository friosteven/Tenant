//
//  HomeEndpoint.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation

enum HomeEndpoint {
    case getResources
    case getImageURL
}

extension HomeEndpoint: Endpoint {


    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    var host: String {
        switch self {
        case .getImageURL:
            return HostEnvironment.supabase(env: .dev).getHostURL()
        default:
            return ""
        }
    }

    var path: String {
        switch self {
        case .getResources:
            return "/rest/v1/Resources"
        case .getImageURL:
            return "/rest/v1/Resources"
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
            return ["apikey": APP_SECRETS.apikey]
        }
    }

    var body: [String : String]? {
        switch self {
        default:
            return nil
        }
    }

    var query: [URLQueryItem]? {
        switch self {
        case .getImageURL:
            return [URLQueryItem(name: "description", value: "eq.floor_plan"),
                    URLQueryItem(name: "select", value: "*")]
        default:
            return []
        }
    }
}
