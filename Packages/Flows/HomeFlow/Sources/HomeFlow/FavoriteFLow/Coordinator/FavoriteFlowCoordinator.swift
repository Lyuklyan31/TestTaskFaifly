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
    case personFavorite(FavoritePersonInputParameters)
}

final class FavoriteFlowCoordinator: NavigationCoordinator<FavoriteFlowRoute> {
    
    // MARK: - Properties
    
    private var rootPresentable: Presentable
    private var favoriteViewModel: FavoriteViewModel
    
    // MARK: - Inits
    
    init(rootViewController: RootViewController, delegate: FavoriteViewModelDelegate) {
        self.favoriteViewModel = FavoriteViewModel(delegate: delegate)
        let viewController = FavoriteView(viewModel: favoriteViewModel).hostable()
        rootPresentable = viewController
        
        super.init(rootViewController: rootViewController, initialRoute: .root)
        favoriteViewModel.router = weakRouter
    }
    
    override func prepareTransition(for route: FavoriteFlowRoute) -> NavigationTransition {
        switch route {
        case .root: return .set([rootPresentable])
        case .back: return .pop()
        case .personFavorite:
            let presentable = favoritePersonPresentable()
            return .push(presentable)
        }
    }
    
    private func favoritePersonPresentable() -> Presentable {
        let viewModel = PersonFavoriteViewModel(
            delegate: favoriteViewModel,
            router: weakRouter,
            inputParameters: .init(
                data: favoriteViewModel.state.person
            )
        )
        let viewController = PersonFavoriteView(viewModel: viewModel).hostable()
        viewController.hidesBottomBarWhenPushed = true
        return viewController
    }
}

// MARK: - InputParameters

struct FavoritePersonInputParameters {
    var data: PersonRealm
}
