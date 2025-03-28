//
//  FavoriteView+Actions.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import Foundation
import RealmSwift

// MARK: - Actions

extension FavoriteView {
    
    enum Actions {
        case deletePerson(PersonRealm)
        case selectedPerson(PersonRealm)
    }
}
