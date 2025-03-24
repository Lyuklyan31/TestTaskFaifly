import Foundation
import XCoordinator
import UIKit

public enum HomeTabRoute: Route {
    case list
    case favorite
    case unFavorite
}

public class HomeCoordinator: TabBarCoordinator<HomeTabRoute> {
    
    // MARK: - Properties
    
    private let listCoordinator: Presentable
    private let favoriteCoordinator: Presentable
    private let unFavoriteCoordinator: Presentable
    
    public init(initialRoute: HomeTabRoute) {
        self.listCoordinator = Self.preparePresentable(for: .list)
        self.favoriteCoordinator = Self.preparePresentable(for: .favorite)
        self.unFavoriteCoordinator = Self.preparePresentable(for: .unFavorite)
        
        let initialSelectedTab: Presentable
        switch initialRoute {
        case .list: initialSelectedTab = listCoordinator
        case .favorite: initialSelectedTab = favoriteCoordinator
        case .unFavorite: initialSelectedTab = unFavoriteCoordinator
        }
        
        super.init(
            tabs: [
                listCoordinator,
                favoriteCoordinator,
                unFavoriteCoordinator
            ],
            select: initialSelectedTab
        )
        
        setupTabBarView()
        setupTabBarItems()
    }
    
    // MARK: - Internal api
    
    public override func prepareTransition(for route: HomeTabRoute) -> TabBarTransition {
        switch route {
        case .list:
            return .select(listCoordinator)
        case .favorite:
            return .select(favoriteCoordinator)
        case .unFavorite:
            return .select(unFavoriteCoordinator)
        }
    }
    
    // MARK: - Private api
    
    private func setupTabBarView() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        appearance.stackedLayoutAppearance.selected.iconColor = .systemPink
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .black.withAlphaComponent(0.3)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black.withAlphaComponent(0.3)]
        
        rootViewController.tabBar.standardAppearance = appearance
        rootViewController.tabBar.scrollEdgeAppearance = appearance
    }

    
    private func setupTabBarItems() {
        listCoordinator.viewController.tabBarItem = .init(
            title: "List",
            image: UIImage(systemName: "list.bullet.rectangle"),
            selectedImage:  UIImage(systemName: "list.bullet.rectangle")
        )
        favoriteCoordinator.viewController.tabBarItem = .init(
            title: "Favorite",
            image: UIImage(systemName: "star.fill"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        unFavoriteCoordinator.viewController.tabBarItem = .init(
            title: "Un Favorite",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star")
        )
    }
    
    static private func preparePresentable(for route: HomeTabRoute) -> Presentable {
        let navigationController = navigationController()
        switch route {
        case .list:
            return ListFlowCoordinator(rootViewController: navigationController)
        case .favorite:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            navigationController.viewControllers = [viewController]
            return navigationController
        case .unFavorite:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            navigationController.viewControllers = [viewController]
            return navigationController
        }
        
    }
    
    static private func navigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}

