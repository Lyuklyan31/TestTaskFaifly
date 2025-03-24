//
//  ListView.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import SwiftUI
import Combine
import Alamofire

struct ListView: View {

    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Button("123456") {
            viewModel.send(.loadPage)
            print(viewModel.state.listPeople)
        }
    }
}
