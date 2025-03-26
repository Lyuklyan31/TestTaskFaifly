//
//  PersonFavoriteView.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 26.03.2025.
//

import SwiftUI
import Kingfisher

struct PersonFavoriteView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: PersonFavoriteViewModel
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            gradientView.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: .zero) {
                    buttonBack
                        .padding(.leading, 16.0)
                    Spacer()
                }
                avatarView(url: viewModel.state.avatar)
                HStack(spacing: .zero) {
                    fullNameView
                    Spacer()
                    buttonUnfollow
                }
                emailView
                supportView
                
                Spacer()
            }
            .padding(.horizontal, 16.0)
            
            copyrightNoticeView
        }
    }
    // MARK: - SubViews
    
    private var buttonUnfollow: some View {
        Button {
            viewModel.send(.unfollow)
        } label: {
            Circle()
                .fill(Color.black.opacity(0.3))
                .stroke(Color.black.opacity(0.1), lineWidth: 1.0)
                .frame(width: 50.0, height: 50.0)
                .shadow(radius: 0.4)
                .overlay {
                    Image(systemName: viewModel.state.isFavorite ? "star.fill" : "star")
                        .font(.title)
                        .foregroundColor(.yellow)
                }
        }
    }
    
    private var gradientView: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.orange.opacity(0.5),
                Color.yellow.opacity(0.5)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
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
        Text(viewModel.state.supportText)
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
    
    private var copyrightNoticeView: some View {
        VStack(spacing: .zero) {
            Spacer()
            copyrightNotice
        }
    }
}
