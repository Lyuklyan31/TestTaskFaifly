import Foundation
import Factory

extension Container {
    
    public var networkClient: Factory<any NetworkClientProtocol> {
        Factory(self) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return NetworkClient(
                decoder: decoder
            )
        }.cached
    }
}
