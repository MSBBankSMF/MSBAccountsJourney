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
        screenState = .loading
        Task { @MainActor in
            do {
                let accounts: [MSBAccountsJourney.AccountsSummary] = try await self.accountsListUseCase.getAccountSummary()
                self.allAccounts = accounts.map{ $0.toMapUI() }
                if allAccounts.isEmpty {
                    screenState = .emptyResults
                } else {
                    screenState = .loaded
                }
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
