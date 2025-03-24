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

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            titleView
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.state.listPeople, id: \.id.rawValue) { person in
                        cellView(person: person)
                            .onAppear {
                                if person == viewModel.state.listPeople.last {
                                    viewModel.send(.loadPage)
                                }
                                print(person.id)
                            }
                    }
                }
            }
            Spacer()
        }
    }
    
    private var titleView: some View {
        Rectangle()
            .foregroundColor(.black)
            .frame(height: 70.0)
            .overlay {
                Text("Test Task: iOS App with SwiftUI & Open API (Pagination & Favorites)")
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
            
        } label: {
            CellView(
                image: person.avatar.rawValue,
                fullName: "\(person.firstName) \(person.lastName)",
                email: person.email.rawValue
            )
            .padding(.horizontal, 16.0)
        }
    }
}
