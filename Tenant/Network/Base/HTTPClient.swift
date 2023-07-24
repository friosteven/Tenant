//
//  HTTPClient.swift
//  Tenant
//
//  Created by Steven Frio on 7/23/23.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}
extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type) async -> Result<T, RequestError> {

        let urlComponents = getURLComponents(endpoint: endpoint)

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        var urlRequest = getURLRequest(endpoint: endpoint, url: url)

        if let body  = endpoint.body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body,
                                                              options: [])
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest,
                                                                    delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decodeError)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedError)
            }

        } catch {
            return .failure(.unknown)
        }
    }

    private func getURLComponents(endpoint: Endpoint) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        return urlComponents
    }

    private func getURLRequest(endpoint: Endpoint, url: URL) -> URLRequest {

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.allHTTPHeaderFields = endpoint.header
        if let queryItems = endpoint.query {
            urlRequest.url?.append(queryItems: queryItems)
        }
        return urlRequest
    }
}
