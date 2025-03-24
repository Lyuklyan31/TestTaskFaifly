//
//  PeopleRoute.swift
//  PeopleClient
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import NetworkClient
import SharedModels

private enum Keys: String {
    case page
}

struct PeopleRoute: Route {
    
    let page: Page
    
    init(page: Page) {
        self.page = page
    }
    
    var baseURL: String {
        "https://reqres.in"
    }
    
    var endpoint: String {
        "/api/users"
    }
    
    var method: APIMethod {
        .GET
    }
     
    var headers: [Header] {
        [.acceptType(.json)]
    }
    
    var parameters: Parameters {
        let queryItems: [URLQueryItem] = [
            .init(name: Keys.page.rawValue, value: "\(page.rawValue)")
        ]
        return .query(queryItems)
    }
}
