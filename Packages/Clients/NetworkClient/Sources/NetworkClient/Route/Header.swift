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

    // MARK: - Factory methods
    
    public static func contentType(_ value: ContentType) -> Self {
        .init(name: "Content-Type", value: value.value)
    }

    public static func acceptType(_ value: AcceptType) -> Self {
        .init(name: "Accept", value: value.value)
    }
}

extension Header {
    
    public enum ContentType {
        case formUrlEncoded
        case json
        
        var value: String {
            switch self {
            case .formUrlEncoded:
                return "application/x-www-form-urlencoded"
            case .json:
                return "application/json"
            }
        }
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
