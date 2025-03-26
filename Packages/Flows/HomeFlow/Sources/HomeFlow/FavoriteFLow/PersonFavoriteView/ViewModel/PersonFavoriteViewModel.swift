//
//  PersonFavoriteViewModel.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 26.03.2025.
//

import Foundation
import XCoordinator
import UIComponents

class PersonFavoriteViewModel: ViewModelProtocol {
    
    typealias State = PersonFavoriteView.State
    typealias Actions = PersonFavoriteView.Actions
    
    @Published var state: State
    
    private var router: WeakRouter<FavoriteFlowRoute>
    
    var inputParameters: FavoritePersonInputParameters
    
    init(
        router: WeakRouter<FavoriteFlowRoute>,
        inputParameters: FavoritePersonInputParameters
    ) {
        self.inputParameters = inputParameters
        self.router = router
        
        self.state = .init(
            avatar: inputParameters.data.avatar,
            email: inputParameters.data.email,
            fullName: inputParameters.data.fullName,
            supportText: inputParameters.data.support,
            copyrightNotice: ""
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
    
    func send(_ actions: PersonFavoriteView.Actions) {
        switch actions {
        case .back: router.trigger(.back)
        }
    }
}
