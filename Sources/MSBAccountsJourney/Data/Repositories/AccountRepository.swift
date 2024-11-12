//
//  AccountRepository.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

public final class AccountRepository: AccountRepositoryProtocol {
    private let remoteDataSource: AccountRemoteDataSource
    
    public init(remoteDataSource: AccountRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    public func getArrangementById(arrangementId: String) async throws -> MSBAccountsJourney.AccountDetailsModel {
        let response = try await remoteDataSource.getArrangementById(arrangementId: arrangementId)
        let accountDetail = response.toDomainModel()
        return accountDetail
    }
    
    public func getAccountSummary() async throws -> [MSBAccountsJourney.AccountsSummary] {
        let response = try await remoteDataSource.getAccountSummary()
        let accounts = response.map{$0.toDomainModel()}
        return accounts
    }
}
