//
//  Parameters.swift
//  
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import Foundation

public enum Parameters {
    
    case plain
    case query([URLQueryItem])
    
    public var queryItems: [URLQueryItem]? {
        guard case .query(let query) = self else {
            return nil
        }
        return query
    }
}
