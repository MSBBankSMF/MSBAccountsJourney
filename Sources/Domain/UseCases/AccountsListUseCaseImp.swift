//
//  AccountsListUseCaseImp.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation
import ClientCommonGen2

public final class AccountsListSummaryUseCaseImp: AccountsListUseCase {
    private let repository: AccountRepositoryProtocol

    // MARK: - Init
    public init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getAccountSummary(_ completion: @escaping(Result<MSBAccountsJourney.AccountsSummary, MSBAccountsJourney.ErrorResponse>) -> Void) {
//        let results = try? self.repository.getAccountSummary()
//        return results
        let call = try? self.repository.getAccountSummary()
        call?.execute({ result in
            switch result {
            case let .success(response):
                guard let productSummary = response.body else {
                    return completion(
                        .failure(
                            MSBAccountsJourney.ErrorResponse(
                                statusCode: response.statusCode,
                                data: nil,
                                error: AccountsList.Error.invalidResponse
                            )
                        )
                    )
                }
                
                completion(.success(productSummary.toDomainModel()))
            case let .failure(error):
                completion(.failure(AccountsJourney.ErrorResponse(error: error)))
            }
        })
    }
}

