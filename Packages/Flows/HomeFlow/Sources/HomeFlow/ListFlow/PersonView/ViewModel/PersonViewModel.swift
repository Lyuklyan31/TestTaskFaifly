//
//  PersonViewModel.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import XCoordinator
import UIComponents
import SharedModels
import RealmSwift

protocol PersonViewModelDelegate: AnyObject {
    func toggleFavorite(person: PersonData, isFavorite: Bool)
}

class PersonViewModel: ViewModelProtocol {
    
    typealias State = PersonView.State
    typealias Actions = PersonView.Action
    
    @Published var state: State
    
    var inputParameters: PersonInputParameters
    
    private var router: WeakRouter<ListFlowRoute>
    
    weak var delegate: PersonViewModelDelegate?
    
    init(
        delegate: PersonViewModelDelegate,
        router: WeakRouter<ListFlowRoute>,
        inputParameters: PersonInputParameters
    ) {
        self.delegate = delegate
        self.inputParameters = inputParameters
        self.router = router
        
        self.state = .init(
            fullName: "\(inputParameters.data.firstName) \(inputParameters.data.lastName)" ,
            avatar: inputParameters.data.avatar.rawValue,
            email: inputParameters.data.email.rawValue,
            support: inputParameters.support,
            copyrightNotice: "",
            isFavorite: inputParameters.data.isFavorite
        )
        
        self.state.copyrightNotice =
                    """
                    Author: Oleh Liuklian  
                    Year: 2025  
                    All rights reserved © Oleh Liuklian.  
                    
                    This code was developed by me exclusively for the purpose of completing a test task.  
                    It is my personal intellectual property and may not be used, copied, or transferred to third parties without my written permission.
                    """
    }
    
    func send(_ actions: Actions) {
        switch actions {
        case .back: router.trigger(.back)
        case .follow:
            delegate?.toggleFavorite(
                person: inputParameters.data,
                isFavorite: self.state.isFavorite
            )
        case .toggle(let newValue):
            self.state.isFavorite = newValue
        }
    }
}
