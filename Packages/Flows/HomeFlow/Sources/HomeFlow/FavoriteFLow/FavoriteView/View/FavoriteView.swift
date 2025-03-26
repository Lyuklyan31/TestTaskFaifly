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
    
    // MARK: - Proprties
    
    @ObservedObject var viewModel: FavoriteViewModel
    
    @ObservedResults(PersonRealm.self) var personRealm
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            gradient.edgesIgnoringSafeArea(.top)
            VStack(spacing: .zero) {
                titleView
                ScrollView(showsIndicators: false) {
                    ForEach(personRealm, id: \.id) { person in
                        buttonView(person)
                            .padding(.horizontal, 16.0)
                    }
                }
            }
            Spacer()
        }
    }
    
    // MARK: - SubViews
    
    private var gradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.purple.opacity(0.5),
                Color.blue.opacity(0.5)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private func buttonView(_ person: PersonRealm) -> some View {
        Button {
            viewModel.send(.selectedPerson(person))
        } label: {
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
    
    private var titleView: some View {
        Rectangle()
            .foregroundColor(.black)
            .frame(height: 70.0)
            .overlay {
                Text(viewModel.state.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal, 16.0)
            }
    }
}
