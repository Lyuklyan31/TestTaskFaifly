//
//  FavoriteView.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import SwiftUI
import Foundation
import UIComponents
import RealmSwift

struct FavoriteView: View {
    
    @ObservedObject var viewModel: FavoriteViewModel
    
    @ObservedResults(PersonRealm.self) var personRealm
    
    var body: some View {

        ForEach(personRealm, id: \.id) { person in
            CellView(
                image: person.avatar,
                fullName: person.fullName,
                email: person.email,
                favorite: .init(
                    get: { person.isFavorite},
                    set: { _ in viewModel.send(.deletePerson(person)) }
                )
            )
        }
    }
}
