//
//  AccountDetailUseCase.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//
import Foundation

public protocol AccountDetailsUseCase {
    func getAccountDetail(arrangementId: String) async throws -> MSBAccountsJourney.AccountDetailsModel
}
