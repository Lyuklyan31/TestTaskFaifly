//
//  Header.swift
//  NetworkClient
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import Foundation

public struct Header {
    
    // MARK: - Declarations
    
    public typealias Key = String
    public typealias Value = String

    // MARK: - Properties
    
    public let name: Key
    public let value: Value

    // MARK: - Factory method

    public static func acceptType(_ value: AcceptType) -> Self {
        .init(name: "Accept", value: value.value)
    }
    
    public enum AcceptType {
        case json
        
        var value: String {
            switch self {
            case .json:
                return "application/json"
            }
        }
    }
}
