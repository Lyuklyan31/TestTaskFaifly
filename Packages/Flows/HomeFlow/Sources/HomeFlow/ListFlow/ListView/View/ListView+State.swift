//
//  ListView+State.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import SharedModels
import NetworkClient

// MARK: - State

extension ListView {
    
    struct State {
        var listPeople: [PersonData]
        var page: Int
        var selectedPerson: PersonData
        var supportText: String
        var title: String
        var favorite: Bool
        var networkStatus: NetworkClientState.ConnectionStatus
    }
}


