//
//  PersonViewModel.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import UIComponents
import XCoordinator

class PersonViewModel: ViewModelProtocol {
    
    typealias State = PersonView.State
    typealias Actions = PersonView.Action
    
    @Published var state: State
    
    var inputParameters: InputParameters
    
    private var router: WeakRouter<ListFlowRoute>
    
    init(router: WeakRouter<ListFlowRoute>, inputParameters: InputParameters) {
        self.inputParameters = inputParameters
        self.router = router
        
        self.state = .init(
            fullName: "\(inputParameters.data.firstName) \(inputParameters.data.lastName)" ,
            avatar: inputParameters.data.avatar.rawValue,
            email: inputParameters.data.email.rawValue,
            support: inputParameters.support,
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
    
    func send(_ actions: PersonView.Action) {
        switch actions {
        case .back: router.trigger(.back)
        }
    }
}
