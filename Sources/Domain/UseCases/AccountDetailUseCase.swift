//
//  AccountDetailUseCase.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//
import Foundation

public protocol AccountDetailsUseCase {
    func getAccountDetail(arrangementId: String, _ completion: @escaping(Result<MSBAccountsJourney.AccountDetailsModel, MSBAccountsJourney.ErrorResponse>) -> Void)
}
