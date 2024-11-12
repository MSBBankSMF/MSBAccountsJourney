//
//  AccountRepositoryProtocol.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//
import Foundation

public protocol AccountRepositoryProtocol: Sendable {
    func getArrangementById(arrangementId: String) async throws -> MSBAccountsJourney.AccountDetailsModel
    func getAccountSummary() async throws -> [MSBAccountsJourney.AccountsSummary]
}

