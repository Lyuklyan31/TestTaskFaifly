//
//  FavoriteViewModel.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import UIComponents
import UIKit
import Foundation
import XCoordinator
import RealmSwift
import Factory

protocol FavoriteViewModelDelegate: AnyObject {
    func makeUnFavorite(person: PersonRealm)
}

class FavoriteViewModel: ViewModelProtocol {
    
    typealias State = FavoriteView.State
    typealias Actions = FavoriteView.Actions
    
    @Published var state: State
    
    weak var delegate: FavoriteViewModelDelegate?
    
    var router: WeakRouter<FavoriteFlowRoute>?
    
    init(delegate: FavoriteViewModelDelegate) {
        self.delegate = delegate
        self.state = .init(
            favoritePeople: .init(),
            person: .init(),
            title: "Test Task: iOS App with SwiftUI & Open API (Pagination & Favorites)"
        )
    }
    
    func send(_ actions: Actions) {
        switch actions {
        case .deletePerson(let person): delegate?.makeUnFavorite(person: person)
        case .selectedPerson(let person):
            self.state.person = person
            router?.trigger(.personFavorite(.init(data: self.state.person)))
        }
    }
}
