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
    
    init() {
        
        self.state = .init(
            listPeople: []
        )
        
        peopleClient.publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] peopleData in
                guard let self = self else { return }
                self.state.listPeople = peopleData.data
            }
            .store(in: &bag)
    }
    
    func send(_ actions: ListView.Action) {
        switch actions {
        case .loadPage:
            Task {
                let result = try await peopleClient.getListPeople(page: 1)
                print(result)
            }
        }
    }
}
