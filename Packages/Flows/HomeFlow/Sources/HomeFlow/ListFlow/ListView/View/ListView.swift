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
        ZStack {
            gradient.edgesIgnoringSafeArea(.top)
            VStack(spacing: .zero) {
                titleView
                listView
                Spacer()
            }
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
    
    private var noInternetConnection: some View {
        ContentUnavailableView(
            "No Internet Connection",
            systemImage: "wifi.exclamationmark",
            description: Text("Please check your connection and try again.")
        )
    }
    
    private var listView: some View {
        ScrollView(showsIndicators: false) {
            if viewModel.networkClient.state.connectionStatus == .disconnected {
                noInternetConnection
            } else {
                LazyVStack {
                    ForEach(viewModel.state.listPeople, id: \.id.rawValue) { person in
                        cellView(person: person)
                            .padding(.horizontal, 16.0)
                            .onAppear {
                                if person == viewModel.state.listPeople.last {
                                    viewModel.send(.loadPage)
                                }
                            }
                    }
                }
            }
        }
        .refreshable {
            viewModel.send(.loadPage)
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
        }
    }
}
