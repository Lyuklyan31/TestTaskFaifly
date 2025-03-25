//
//  ListView+Action.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import SharedModels

extension ListView {
    
    enum Action {
        case loadPage
        case selectedPerson(PersonData)
        case makeFavorite(PersonData, Bool)
    }
}
