//
//  AccountRepository.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

public class AccountRepository: AccountRepositoryProtocol {
    private let remoteDataSource: AccountRemoteDataSource
    
    public init(remoteDataSource: AccountRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    public func getArrangementById(arrangementId: String) throws -> MSBAccountsJourney.AccountDetailsModel {
        let response = try remoteDataSource.getArrangementById(arrangementId: arrangementId)
        let accountDetail = response.toDomainModel()
        return accountDetail
    }
    
    public func getAccountSummary() throws -> [MSBAccountsJourney.AccountsSummary] {
        let response = try remoteDataSource.getAccountSummary()
        let accounts = response.map{$0.toDomainModel()}
        return accounts
    }
}
