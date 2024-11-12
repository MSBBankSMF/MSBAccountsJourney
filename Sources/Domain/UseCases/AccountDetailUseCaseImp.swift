//
//  AccountDetailUseCaseImp.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation
import ClientCommonGen2

public final class AccountDetailUseCaseImp: AccountDetailsUseCase {
    private let repository: AccountRepositoryProtocol

    // MARK: - Init
    public init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getAccountDetail(arrangementId: String, _ completion: @escaping(Result<MSBAccountsJourney.AccountDetailsModel, MSBAccountsJourney.ErrorResponse>) -> Void) {
        let results = try? self.repository.getArrangementById(arrangementId: arrangementId)
        
    }
}

