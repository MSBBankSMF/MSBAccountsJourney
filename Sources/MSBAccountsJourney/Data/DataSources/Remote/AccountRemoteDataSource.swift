//
//  AccountRemoteDataSource.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

public protocol AccountRemoteDataSource: Sendable {
    func getArrangementById(arrangementId: String) async throws -> AccountDetailDTO
    func getAccountSummary() async throws -> [AccountSummaryDTO.AccountSummaryItemDTO]
}
