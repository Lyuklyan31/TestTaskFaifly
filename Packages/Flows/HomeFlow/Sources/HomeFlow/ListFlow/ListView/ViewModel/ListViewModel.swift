//
//  ListViewModel.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import UIComponents
import XCoordinator
import Alamofire
import PeopleClient
import Factory
import Combine

class ListViewModel: ViewModelProtocol {
    
    typealias State = ListView.State
    typealias Actions = ListView.Action
    
    @Published var state: State
    
    var router: WeakRouter<ListFlowRoute>?
    
    @Injected(\.peopleClient) var peopleClient
    
    private var bag: Set<AnyCancellable> = .init()
    private var isLoading = false
    
    init() {
        self.state = .init(
            listPeople: [],
            page: 1
        )
        loadPeople()
    }
    
    func send(_ actions: ListView.Action) {
        switch actions {
        case .loadPage:
            loadPeople()
        }
    }
    
    func loadPeople() {
        guard !isLoading else { return }
        isLoading = true
        
        Task {
            let peopleData = try await peopleClient.getListPeople(page: state.page)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.state.listPeople.append(contentsOf: peopleData.data)
                self.state.page += 1
                self.isLoading = false
            }
        }
    }
}
