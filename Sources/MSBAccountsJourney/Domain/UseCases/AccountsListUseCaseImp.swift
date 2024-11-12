//
//  AccountsListUseCaseImp.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

public final class AccountsListSummaryUseCaseImp: AccountsListUseCase {
    private let repository: AccountRepositoryProtocol

    // MARK: - Init
    public init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getAccountSummary() async throws -> [MSBAccountsJourney.AccountsSummary] {
        let results = try await self.repository.getAccountSummary()
        return results
    }
}

