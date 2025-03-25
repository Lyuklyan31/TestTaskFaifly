//
//  File.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 25.03.2025.
//

import Foundation
import XCoordinator
import UIComponents
import Extensions
import UIKit
import SharedModels

enum FavoriteFlowRoute: Route {
    case root
    case back
}

final class FavoriteFlowCoordinator: NavigationCoordinator<FavoriteFlowRoute> {
    
    // MARK: - Properties
    
    private var rootPresentable: Presentable
    private var favoriteViewModel: FavoriteViewModel
    
    // MARK: - Inits
    
    init(rootViewController: RootViewController) {
        self.favoriteViewModel = FavoriteViewModel()
        let viewController = FavoriteView(viewModel: favoriteViewModel).hostable()
        rootPresentable = viewController
        
        super.init(rootViewController: rootViewController, initialRoute: .root)
        favoriteViewModel.router = weakRouter
    }
    
    override func prepareTransition(for route: FavoriteFlowRoute) -> NavigationTransition {
        switch route {
        case .root: return .set([rootPresentable])
        case .back: return .pop()
        }
    }
}
