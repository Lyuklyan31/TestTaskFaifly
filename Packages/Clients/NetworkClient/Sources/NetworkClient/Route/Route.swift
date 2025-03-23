//
//  Route.swift
//  NetworkClient
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import Foundation

public protocol Route {
    
    var baseURL: String { get }
    var endpoint: String { get }
    var method: APIMethod { get }
    var headers: [Header] { get }
    var parameters: Parameters { get }
}
