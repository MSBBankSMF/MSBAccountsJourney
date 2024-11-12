//
//  AccountDetailUseCaseImp.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

public final class AccountDetailUseCaseImp: AccountDetailsUseCase {
    private let repository: AccountRepositoryProtocol

    // MARK: - Init
    public init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getAccountDetail(arrangementId: String) async throws -> MSBAccountsJourney.AccountDetailsModel {
        let results = try await self.repository.getArrangementById(arrangementId: arrangementId)
        return results
    }
}

