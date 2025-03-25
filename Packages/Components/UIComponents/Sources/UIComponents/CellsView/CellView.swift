//
//  CellView.swift
//
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Kingfisher
import SwiftUI

public struct CellView: View {
    
    public var image: String
    public var fullName: String
    public var email: String
    @Binding public var favorite: Bool
     
    public init(
        image: String,
        fullName: String,
        email: String,
        favorite: Binding<Bool>
     ) {
         self.image = image
         self.fullName = fullName
         self.email = email
         self._favorite = favorite
     }
    
    public var body: some View {
        HStack(spacing: 20.0) {
            imageView
            personDataView
            Spacer()
            favoriteButton(for: favorite)
        }
        .frame(height: 90)
    }
    
    // MARK: - SubViews
    
    private func favoriteButton(for favorite: Bool) -> some View {
        Button {
            self.favorite.toggle()
        } label: {
            if favorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
            } else {
                Image(systemName: "star")
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
            }
        }
    }
    
    private var imageView: some View {
        KFImage(URL(string: image))
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1.0))
            .shadow(radius: 4.0)
    }

    private var personDataView: some View {
        VStack(spacing: 10.0) {
            Text(fullName)
                .font(.title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(email)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
