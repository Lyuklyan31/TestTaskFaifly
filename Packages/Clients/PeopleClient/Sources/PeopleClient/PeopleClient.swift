import NetworkClient
import Combine
import Foundation
import SharedModels

final class PeopleClient: PeopleClientProtocol {
    
    // MARK: - Properties
    
    var state: CreatePeopleData { currentStateSubject.value }
    
    var publisher: AnyPublisher<CreatePeopleData, Never> {
        currentStateSubject.eraseToAnyPublisher()
    }
    
    private let networkClient: any NetworkClientProtocol
    
    private let currentStateSubject: CurrentValueSubject<CreatePeopleData, Never>
    
    // MARK: - Inits
    
    init(
        networkClient: any NetworkClientProtocol
    ) {
        let peopleData = CreatePeopleData()
        
        self.networkClient = networkClient
        self.currentStateSubject = CurrentValueSubject(peopleData)
    }
    
    func getListPeople(page: Int) async throws -> CreatePeopleData {
        let route = PeopleRoute(page: .init(page))
        let result = await networkClient.send(route: route, responseType: PeopleDTO.self)
        
        switch result {
        case .success(let dto):
            let peopleData = CreatePeopleData(dto: dto)
            currentStateSubject.send(peopleData)
            return peopleData
        case .failure(let error):
            throw error
        }
    }
}
