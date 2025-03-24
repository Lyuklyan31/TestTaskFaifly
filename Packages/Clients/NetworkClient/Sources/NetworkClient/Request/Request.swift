//
//  Request.swift
//  NetworkClient
//
//  Created by Oleh Liuklian  on 23.03.2025.
//

import Foundation
import Alamofire

final class Request: @unchecked Sendable {
    
    private let route: Route
    
    init(route: Route) {
        self.route = route
    }
}

extension Request {
    
    public func dataRequest() -> DataRequest {
        AF.request(self)
            .validate()
    }
}

extension Request: URLRequestConvertible {
    
    public func asURLRequest() throws -> URLRequest {
        try route.asURLRequest()
    }
}

extension Route {
    
    func asURLRequest() throws -> URLRequest {
        var request = try createRequest()
        
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.name) }
        
        switch parameters {
        case .plain:
            return request
        case .query(let queryItems):
            let dict: [String: Any] = queryItems.reduce(into: [:]) { (result, item) in
                result[item.name] = item.value
            }
            
            let parameterEncoding = URLEncoding(destination: .queryString)
            return try parameterEncoding.encode(request, with: dict)
        }
    }
    
    func createRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL)?.appendingPathComponent(endpoint) else {
            throw NetworkClientError.failedToBuildRequest
        }
        return URLRequest(url: url)
    }
}

