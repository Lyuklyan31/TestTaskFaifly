//
//  ListView.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import SwiftUI
import Combine
import UIComponents
import Alamofire
import SharedModels
import Shared

struct ListView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: ListViewModel
    
    // MARK: - Body
    
    var body: some View {
        
        VStack(spacing: .zero) {
            titleView
            listView
            Spacer()
        }
    }
    
    // MARK: - SubViews
    
    private var listView: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.state.listPeople, id: \.id.rawValue) { person in
                    cellView(person: person)
                        .onAppear {
                            if person == viewModel.state.listPeople.last {
                                viewModel.send(.loadPage)
                            }
                        }
                }
            }
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
                    .padding(.horizontal, 16)
            }
    }
    
    private func cellView(person: PersonData) -> some View {
        Button {
            viewModel.send(.selectedPerson(person))
        } label: {
            CellView(
                image: person.avatar.rawValue,
                fullName: "\(person.firstName) \(person.lastName)",
                email: person.email.rawValue,
                favorite: .init(
                    get: { person.isFavorite },
                    set: { newValue in viewModel.send(.makeFavorite(person, newValue)) }
                )
            )
            .padding(.horizontal, 16.0)
        }
    }
}
