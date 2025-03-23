//
//  ConnectionMonitor.swift
//  NetworkClient
//
//  Created by Oleh Liuklian  on 23.03.2025.
//

import Foundation
import Network
import Combine

final class ConnectionMonitor: @unchecked Sendable {
    
    typealias State = NetworkClientState.ConnectionStatus
    
    // MARK: - Properties
    
    var state: State { valueSubject.value }
    let publisher: AnyPublisher<State, Never>
    
    private let monitor: NWPathMonitor
    private let observingQueue: DispatchQueue = DispatchQueue(label: "NetworkConnectivityMonitor")
    
    private let valueSubject: CurrentValueSubject<State, Never>
    
    // MARK: - Inits
    
    init() {
        monitor = NWPathMonitor()
        valueSubject = .init(.connected(.wifi))
        publisher = valueSubject.eraseToAnyPublisher()
        
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            if path.status == .satisfied {
                let interfaceType: State.ConnectionType = path.usesInterfaceType(.wifi) ? .wifi : .cellular
                self.valueSubject.send(.connected(interfaceType))
            } else {
                self.valueSubject.send(.disconnected)
            }
        }
    }
}

