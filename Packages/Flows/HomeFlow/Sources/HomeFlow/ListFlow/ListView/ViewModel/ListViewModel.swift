//
//  ListViewModel.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import XCoordinator
import SharedModels
import Alamofire
import PeopleClient
import Factory
import Combine
import Shared

class ListViewModel: ViewModelProtocol {
    
    typealias State = ListView.State
    typealias Actions = ListView.Action
    
    @Published var state: State
    
    var router: WeakRouter<ListFlowRoute>?
    
    @Injected(\.peopleClient) var peopleClient
           
    private var bag: Set<AnyCancellable> = .init()
    private var isLoading = false
    
    private let personRepository: PersonRepository
    
    init() {
        
        self.state = .init(
            listPeople: [],
            page: 1,
            selectedPerson: .init(),
            supportText: .init(),
            title: "Test Task: iOS App with SwiftUI & Open API (Pagination & Favorites)",
            favorite: false
            
        )
        loadPeople()
    }
    
    func send(_ actions: ListView.Action) {
        switch actions {
        case .loadPage: loadPeople()
        case .selectedPerson(let person):
            self.state.selectedPerson = person
            self.state.supportText = peopleClient.state.support.text
            router?.trigger(.person(.init(data: self.state.selectedPerson, support: self.state.supportText)))
        case .makeFavorite(let person, let newValue): break
//            updateFavorite(for: person, isFavorite: newValue)
        }
    }
    
    func loadPeople() {
        guard !isLoading else { return }
        isLoading = true
        
        Task {
            let peopleData = try await peopleClient.getListPeople(page: state.page)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.state.listPeople.append(contentsOf: peopleData.data)
                self.state.page += 1
                self.isLoading = false
            }
        }
    }
    
//    func updateFavorite(for person: PersonData, isFavorite: Bool) {
//        if let index = state.listPeople.firstIndex(where: { $0.id == person.id }) {
//            state.listPeople[index].isFavorite = isFavorite
//
////            if let personRealm = realm.object(ofType: PersonRealm.self, forPrimaryKey: person.id.rawValue) {
////                try! realm.write {
////                    personRealm.isFavorite = isFavorite
////                }
////            } else {
////                let newPersonRealm = PersonRealm(from: state.listPeople[index])
////                try! realm.write {
////                    realm.add(newPersonRealm)
////                }
////            }
//        }
//    }
}
