//
//  AccountsListViewModel.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//

import Foundation
import Combine
import Resolver
import MSBNetworking
import MSBLogger

final class AccountsListViewModel: NSObject {
    
    @Published private(set) var allAccounts = [AccountUIModel]()
    @Published private(set) var screenState: AccountListScreenState = .loading

    private lazy var accountsListUseCase: AccountsListUseCase = {
        guard let useCase = Resolver.optional(AccountsListUseCase.self) else {
            fatalError("AccountsListUseCase needed to continue")
        }
        return useCase
    }()
    
    @MainActor
    private func getAccountSummary(fromEvent event: AccountListScreenEvent) {
        Task { @MainActor in
            do {
                try await MSBAPIClient.shared.performRequest(action: {
                    let accounts: [MSBAccountsJourney.AccountsSummary] = try await self.accountsListUseCase.getAccountSummary()
                    self.allAccounts = accounts.map{ $0.toMapUI() }
                    if allAccounts.isEmpty {
                        screenState = .emptyResults
                    } else {
                        screenState = .loaded
                    }
                }, loading: { [weak self] isLoading in
                    guard let self else { return }
                    self.screenState = isLoading ? .loading : .loaded
                }, alertErrorNetworkConnection: MSBAPIClient.shared.alertErrorNetworkConnection,
                 alertErrorNetworkCommon: MSBAPIClient.shared.alertErrorNetworkCommon,
                 onAlertNetworkAction: { action, error in
                    MSBLogger().debug("\(action) error: \(error)")
                }
                )
            } catch {
                screenState = .hasError
            }
        }
    }
    
    @MainActor func onEvent(_ event: AccountListScreenEvent) {
        switch event {
        case .getAccounts:
            getAccountSummary(fromEvent: .getAccounts)
        case .refresh:
            getAccountSummary(fromEvent: .refresh)
        }
    }

}
