//
//  ListFlowCoordinator.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import XCoordinator
import Foundation
import UIKit
import Extensions

enum ListFlowRoute: Route {
    case root
    case back
}

final class ListFlowCoordinator: NavigationCoordinator<ListFlowRoute> {
    
    // MARK: - Properties
    
    private var rootPresentable: Presentable
    private var listViewModel: ListViewModel
    
    // MARK: - Inits
    
    init(rootViewController: RootViewController) {
        self.listViewModel = ListViewModel()
        let viewController = ListView(viewModel: listViewModel).hostable()
        rootPresentable = viewController
        super.init(rootViewController: rootViewController, initialRoute: .root)
        listViewModel.router = weakRouter
    }
    
    override func prepareTransition(for route: ListFlowRoute) -> NavigationTransition {
        switch route {
        case .root: return .set([rootPresentable])
        case .back: return .pop()
        }
    }
}



