//
//  FavoriteView+State.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import Foundation

// MARK: - State

extension FavoriteView {
    
    struct State {
        var favoritePeople: [PersonRealm]
        var person: PersonRealm
        var title: String
    }
}
