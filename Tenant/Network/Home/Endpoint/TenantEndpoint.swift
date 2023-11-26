//
//  HomeEndpoint.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation

enum TenantEndpoint {
    case getResources
    case getImageURL
    case getTenant

    case addTenant(request: AddTenantRequest)
}

extension TenantEndpoint: Endpoint {

    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    var host: String {
        switch self {
        default:
            return HostEnvironment.supabase(env: .dev).getHostURL()
        }
    }

    var path: String {
        switch self {
        case .getResources:
            return "/rest/v1/Resources"
        case .getImageURL:
            return "/rest/v1/Resources"
        case .getTenant:
            return "/rest/v1/Tenants"
        case .addTenant:
            return "/rest/v1/rpc/add_tenant"
        }
    }

    var method: RequestMethod {
        switch self {
        case .addTenant:
            return .post
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

    var body: [String : Any]? {
        switch self {
        case .addTenant(let request):
            return request.asDictionary
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
