//
//  AccountSummaryDTO.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

public struct AccountSummaryDTO: Decodable, Sendable {
    public let currentAccounts: CurrentAccountDTO?
}

extension AccountSummaryDTO {
    public struct CurrentAccountDTO: Decodable, Sendable  {
        public let products: [AccountSummaryItemDTO]?
    }
    
    public struct AccountSummaryItemDTO: Decodable, Sendable {
        public let id: String
        public let name: String?
        public let availableBalance: String?
        public let currency: String?
        public let additions: [String: String]?
        
        func toDomainModel() -> MSBAccountsJourney.AccountsSummary {
            return MSBAccountsJourney.AccountsSummary(
                id: id,
                name: name,
                balance: availableBalance,
                currencyCode: currency,
                additions: additions
            )
        }
    }


}
