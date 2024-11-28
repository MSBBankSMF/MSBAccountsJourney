//
//  MSBAccountCoordinator.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import Foundation
import UIKit
import SwiftUI

public final class MSBAccountCoordinator {
    private let navigationController: UINavigationController
    
    public init(rootViewController: UINavigationController) {
        self.navigationController = rootViewController
    }
    
}

extension MSBAccountCoordinator: MSBAccountNavigation {
    public func routeToAccountList() {
        let viewModel = AccountsListViewModel()
        let contentView = AccountsListView(viewModel: viewModel)
        let controller = UIHostingController(rootView: contentView)
        navigationController.pushViewController(controller, animated: true)
    }
    
    public func routeToAccountDetail(arrangementId: String) {}
    
    
}
