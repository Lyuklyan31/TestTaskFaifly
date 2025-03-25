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
import UIComponents
import RealmSwift

class ListViewModel: ViewModelProtocol {
    
    typealias State = ListView.State
    typealias Actions = ListView.Action
    
    @Published var state: State
    
    var router: WeakRouter<ListFlowRoute>?
    
    @Injected(\.peopleClient) var peopleClient: any PeopleClientProtocol
    
    private var bag: Set<AnyCancellable> = .init()
    private var isLoading = false
    
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
        case .makeFavorite(let person, let newValue):
            updatePersonFavoriteStatus(person: person, newValue: newValue)
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
    
    func updatePersonFavoriteStatus(person: PersonData, newValue: Bool) {
        let realm = try! Realm()
        
        if let index = self.state.listPeople.firstIndex(of: person) {
            self.state.listPeople[index].isFavorite = newValue
        }
        
        if !newValue {
            if let personRealm = realm.objects(PersonRealm.self).filter("ownerId == %@", person.id.rawValue).first {
                try! realm.write {
                    realm.delete(personRealm)
                }
            }
        } else {
            if let personRealm = realm.objects(PersonRealm.self).filter("ownerId == %@", person.id.rawValue).first {
                try! realm.write {
                    personRealm.isFavorite = newValue
                }
            } else {
                let personRealm = PersonRealm(personData: person)
                try! realm.write {
                    realm.add(personRealm)
                }
            }
        }
    }
}
