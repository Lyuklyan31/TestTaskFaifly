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
    private let sessionManager: Session
    
    init(
        route: Route,
        sessionManager: Session
    ) {
        self.route = route
        self.sessionManager = sessionManager
    }
}
