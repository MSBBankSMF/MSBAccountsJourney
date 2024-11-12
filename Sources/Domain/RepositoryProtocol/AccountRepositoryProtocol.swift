//
//  AccountRepositoryProtocol.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//
import ClientCommonGen2

public protocol AccountRepositoryProtocol {
    func getArrangementById(arrangementId: String) throws -> MSBAccountsJourney.AccountDetailsModel
//    func getAccountSummary() throws -> [MSBAccountsJourney.AccountsSummary]
    func getAccountSummary() throws -> ClientCommonGen2.Call<[MSBAccountsJourney.AccountsSummary]>
}

