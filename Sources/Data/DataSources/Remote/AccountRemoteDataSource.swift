//
//  AccountRemoteDataSource.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

protocol AccountRemoteDataSource {
    func getArrangementById(arrangementId: String) throws -> AccountDetailDTO
    func getAccountSummary() throws -> [AccountSummaryDTO]
}
