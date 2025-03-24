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
     
    public init(
        image: String,
        fullName: String,
        email: String
     ) {
         self.image = image
         self.fullName = fullName
         self.email = email
     }
    
    public var body: some View {
        HStack(spacing: 20.0) {
            imageView
            personDataView
        }
        .frame(height: 90)
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
