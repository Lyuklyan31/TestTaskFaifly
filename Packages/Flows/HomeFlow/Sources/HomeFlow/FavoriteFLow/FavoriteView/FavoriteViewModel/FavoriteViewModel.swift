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



class FavoriteViewModel: ViewModelProtocol {
    
    typealias State = FavoriteView.State
    typealias Actions = FavoriteView.Actions
    
    @Published var state: State
    
    var router: WeakRouter<FavoriteFlowRoute>?
    
    private var notificationToken: NotificationToken?
    
    init() {
        self.state = .init(
            favoritePeople: .init()
        )
    }
    
    func send(_ actions: Actions) {
        switch actions {
        case .deletePerson(let person): break
        }
    }
}
