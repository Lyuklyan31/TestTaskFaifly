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
    
}

// MARK: - State

public struct NetworkClientState {
    
    public var connectionStatus: ConnectionStatus
    
    public init(connectionStatus: ConnectionStatus) {
        self.connectionStatus = connectionStatus
    }
}

extension NetworkClientState: Equatable { }
extension NetworkClientState: Hashable { }
extension NetworkClientState: Sendable { }

extension NetworkClientState {
    
    public enum ConnectionStatus {
        case connected(ConnectionType)
        case disconnected
    }
}

extension NetworkClientState.ConnectionStatus: Equatable { }
extension NetworkClientState.ConnectionStatus: Hashable { }
extension NetworkClientState.ConnectionStatus: Sendable { }


extension NetworkClientState.ConnectionStatus {
    
    public enum ConnectionType {
        case cellular
        case wifi
    }
}

extension NetworkClientState.ConnectionStatus.ConnectionType: Equatable { }
extension NetworkClientState.ConnectionStatus.ConnectionType: Hashable { }
extension NetworkClientState.ConnectionStatus.ConnectionType: Sendable { }

