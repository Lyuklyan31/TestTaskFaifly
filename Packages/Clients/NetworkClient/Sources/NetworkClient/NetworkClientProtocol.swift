//
//  NetworkClientProtocol.swift
//  NetworkClient
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import Foundation
import Shared
import Combine

// MARK: - Interface

public protocol NetworkClientProtocol: ClientProtocol {
    var state: NetworkClientState { get }
    var publisher: AnyPublisher<NetworkClientState, Never> { get }
    @discardableResult
    func send<T: Decodable>(route: Route, responseType: T.Type) async -> Result<T, NetworkClientError>
}

public enum NetworkClientError: LocalizedError {
    case requestFailed(Error)
    case failedToBuildRequest
    case failedToSendRequest
    case failedToFetchData
    case networkUnavailable
    case invalidResponse
}

// MARK: - State

public struct NetworkClientState: Equatable, Hashable, Sendable {
    
    public var connectionStatus: ConnectionStatus
    
    public init(connectionStatus: ConnectionStatus) {
        self.connectionStatus = connectionStatus
    }
}

extension NetworkClientState {
    
    public enum ConnectionStatus: Equatable, Hashable, Sendable {
        case connected(ConnectionType)
        case disconnected
    }
}

extension NetworkClientState.ConnectionStatus {
    
    public enum ConnectionType: Equatable, Hashable, Sendable {
        case cellular
        case wifi
    }
}
