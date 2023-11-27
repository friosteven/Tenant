//
//  HostEnvironment.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation


enum HostEnvironment {
    case supabase(env: Environment)
    case firebase(env: Environment)
    case fakeStore(env: Environment)

    enum Environment {
        case dev
        case staging
        case prod
    }

    func getHostURL() -> String {
        switch self {
        case .supabase(let env):
            switch env {
            case .dev:
                return "brznhpsnqbnvxamlhjmh.supabase.co"
            case .staging:
                return "supabaseHostStaging"
            case .prod:
                return "supabaseHostProd"
            }
        case .firebase(let env):
            switch env {
            case .dev:
                return "firebaseHostDev"
            case .staging:
                return "firebaseHostStaging"
            case .prod:
                return "firebaseHostProd"
            }
        case.fakeStore(let env):
            switch env {
            case .dev:
                return "fakestoreapi.com"
            case .staging:
                return ""
            case .prod:
                return ""
            }
        }
    }
}
