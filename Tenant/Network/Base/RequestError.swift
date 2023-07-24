//
//  RequestError.swift
//  Tenant
//
//  Created by Steven Frio on 7/24/23.
//

import Foundation

enum RequestError: Error {
    case genericError
    case invalidURL
    case unknown
    case noResponse
    case decodeError
    case unauthorized
    case unexpectedError
}
