//
//  NetworkClient.swift
//  NetworkClient
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import Shared
import Foundation
import Combine
import Alamofire

public class NetworkClient: NetworkClientProtocol {
    
    public var state: NetworkClientState { valueSubject.value }
    
    public var publisher: AnyPublisher<NetworkClientState, Never> {
        valueSubject.eraseToAnyPublisher()
    }
    
    private let decoder: JSONDecoder
    private let valueSubject: CurrentValueSubject<NetworkClientState, Never>
    private let connectionMonitor: ConnectionMonitor
    
    private var bag: Set<AnyCancellable> = .init()

    init(decoder: JSONDecoder) {
        self.connectionMonitor = .init()
        self.decoder = decoder
        
        let state: NetworkClientState = .init(connectionStatus: connectionMonitor.state)
        self.valueSubject = .init(state)
    }
    
    @discardableResult
    public func send<T: Decodable>(route: Route, responseType: T.Type) async -> Result<T, NetworkClientError> {
        do {
            let result = try await dataRequest(for: route)
                .serializingDecodable(T.self, decoder: decoder)
                .value
            return .success(result)
        } catch {
            return .failure(.requestFailed(error))
        }
    }

    
    // MARK: - Private api
    
    private func dataRequest(for route: Route) async -> DataRequest {
        Request(route: route)
            .dataRequest()
            .validate()
    }
}
