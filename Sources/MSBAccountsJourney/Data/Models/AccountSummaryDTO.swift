//
//  AccountSummaryDTO.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

public struct AccountSummaryDTO: Decodable, Sendable {
    public let id: String
    public let name: String?
    public let balance: String?
    public let currencyCode: String?
    public let additions: [String: String]?
    
    func toDomainModel() -> MSBAccountsJourney.AccountsSummary {
        return MSBAccountsJourney.AccountsSummary(
            id: id,
            name: name,
            balance: balance,
            currencyCode: currencyCode,
            additions: additions
        )
    }
}
