//
//  AccountsListUseCase.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//
import Foundation

public protocol AccountsListUseCase: Sendable {
    func getAccountSummary() async throws -> [MSBAccountsJourney.AccountsSummary]
}

