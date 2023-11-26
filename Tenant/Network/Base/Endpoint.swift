//
//  Endpoint.swift
//  Tenant
//
//  Created by Steven Frio on 7/20/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
    var query: [URLQueryItem]? { get }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}
