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
    
    // MARK: - Declarations
    
    typealias State = PersonFavoriteView.State
    typealias Actions = PersonFavoriteView.Actions
    
    // MARK: - Properties
    
    @Published var state: State
    
    private var router: WeakRouter<FavoriteFlowRoute>
    
    var inputParameters: FavoritePersonInputParameters
    
    weak var delegate: FavoriteViewModelDelegate?
    
    // MARK: - Inits
    
    init(
        delegate: FavoriteViewModelDelegate,
        router: WeakRouter<FavoriteFlowRoute>,
        inputParameters: FavoritePersonInputParameters
    ) {
        self.delegate = delegate
        self.inputParameters = inputParameters
        self.router = router
        
        self.state = .init(
            avatar: inputParameters.data.avatar,
            email: inputParameters.data.email,
            fullName: inputParameters.data.fullName,
            supportText: inputParameters.data.support,
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
    
    // MARK: - Internal API
    
    func send(_ actions: PersonFavoriteView.Actions) {
        switch actions {
        case .back: router.trigger(.back)
        case .unfollow:
            router.trigger(.back)
            delegate?.makeUnFavorite(person: inputParameters.data)
        }
    }
}
