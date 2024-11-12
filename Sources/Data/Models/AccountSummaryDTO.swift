//
//  AccountSummaryDTO.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

public struct AccountSummaryDTO: Decodable {
    public let additions: [String: String]?
    
    func toDomainModel() -> MSBAccountsJourney.AccountsSummary {
        return MSBAccountsJourney.AccountsSummary(
            additions: additions
        )
    }
}
