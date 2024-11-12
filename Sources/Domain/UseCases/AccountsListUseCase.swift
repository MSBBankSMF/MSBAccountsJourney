//
//  AccountsListUseCase.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//
import Foundation

public protocol AccountsListUseCase {
    func getAccountSummary(_ completion: @escaping(Result<MSBAccountsJourney.AccountsSummary, MSBAccountsJourney.ErrorResponse>) -> Void)
}

