//
//  MSBAccountCoordinator.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import Foundation
//import XCoordinator
import UIKit

//public final class MSBAccountCoordinator: NavigationCoordinator<MSBAccountRoute> {
//    
//    public init(rootViewController: RootViewController) {
//        super.init(rootViewController: rootViewController)
//    }
//    
//    public override func prepareTransition(for route: MSBAccountRoute) -> NavigationTransition {
//        switch route {
//        case .accountList:
//            return makeAccountListTransition()
//        case let .accountDetail(arrangementId):
//            return makeAccountDetailTransition(arrangementId: arrangementId)
//        }
//    }
//}

public final class MSBAccountCoordinator {
    private let navigationController: UINavigationController
    
    public init(rootViewController: UINavigationController) {
        self.navigationController = rootViewController
    }
    
}

extension MSBAccountCoordinator: MSBAccountNavigation {
    public func routeToAccountList() {
        let viewModel = AccountsListViewModel()
        let controller = AccountsListViewController(viewModel: viewModel)
//        controller.router = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    public func routeToAccountDetail(arrangementId: String) {
        let viewModel = AccountsListViewModel()
        let controller = AccountsListViewController(viewModel: viewModel)
//        controller.router = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    
}


extension MSBAccountCoordinator {
    func makeAccountListTransition() -> NavigationTransition {
        let viewModel = AccountsListViewModel()
//        let controller = AccountsListViewController(viewModel: viewModel)
//        controller.router = self
//        return .push(controller)
        return .none()
    }
    
    func makeAccountDetailTransition(arrangementId: String) -> NavigationTransition {
//        let viewModel = AccountsListViewModel()
//        let controller = AccountsListViewController(viewModel: viewModel)
//        controller.router = self
//        return .push(controller)
        return .none()
    }
    
}
