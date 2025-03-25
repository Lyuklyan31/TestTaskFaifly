//
//  PersonView.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import SwiftUI
import Kingfisher

struct PersonView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: PersonViewModel
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack(spacing: .zero) {
                    buttonBack
                        .padding(.leading, 16.0)
                    Spacer()
                }
                avatarView(url: viewModel.state.avatar)
                fullNameView
                emailView
                supportView
                
                Spacer()
            }
            .padding(.horizontal, 16.0)
            
            VStack(spacing: .zero) {
                Spacer()
                copyrightNotice
            }
        }
    }
    
    // MARK: - SubViews
    
    private var buttonBack: some View {
        Button {
            viewModel.send(.back)
        } label: {
            Circle()
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(.black)
                .overlay {
                    Image(systemName: "arrowshape.backward")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 25.0, height: 25.0)
                }
        }
    }
    
    private func avatarView(url: String) -> some View {
        KFImage(URL(string: url))
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
            .shadow(radius: 4.0)
    }
    
    private var fullNameView: some View {
        Text(viewModel.state.fullName)
            .font(.title)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var emailView: some View {
        Text(viewModel.state.email)
            .font(.headline)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var supportView: some View {
        Text(viewModel.state.support)
            .font(.caption)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var copyrightNotice: some View {
        Text(viewModel.state.copyrightNotice)
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.horizontal, 16.0)
    }
}
