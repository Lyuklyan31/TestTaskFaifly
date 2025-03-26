//
//  ListFlowCoordinator.swift
//  HomeFlow
//
//  Created by Oleh Liuklian  on 24.03.2025.
//

import Foundation
import XCoordinator
import UIComponents
import Extensions
import UIKit
import SharedModels

enum ListFlowRoute: Route {
    case root
    case back
    case person(PersonInputParameters)
}

final class ListFlowCoordinator: NavigationCoordinator<ListFlowRoute> {
    
    // MARK: - Properties
    
    private var rootPresentable: Presentable
    private var listViewModel: ListViewModel
    
    // MARK: - Inits
    
    init(rootViewController: RootViewController, listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
        let viewController = ListView(viewModel: listViewModel).hostable()
        rootPresentable = viewController
        
        super.init(rootViewController: rootViewController, initialRoute: .root)
        listViewModel.router = weakRouter
    }
    
    override func prepareTransition(for route: ListFlowRoute) -> NavigationTransition {
        switch route {
        case .root: return .set([rootPresentable])
        case .back: return .pop()
        case .person:
            let presentable = personPresentable()
            return .push(presentable)
        }
    }
    
    private func personPresentable() -> Presentable {
        let viewModel = PersonViewModel(
            delegate: listViewModel,
            router: weakRouter,
            inputParameters: .init(
                data: listViewModel.state.selectedPerson,
                support: listViewModel.state.supportText
            )
        )
        let viewController = PersonView(viewModel: viewModel).hostable()
        viewController.hidesBottomBarWhenPushed = true
        return viewController
    }
}
// MARK: - InputParameters

struct PersonInputParameters {
    var data: PersonData
    var support: String
}
