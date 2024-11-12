//
//  AccountSummary.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

extension MSBAccountsJourney {
    public struct AccountsSummary: Sendable, Equatable {
        public let id: String
        public let name: String?
        public let balance: String?
        public let currencyCode: String?
        public let additions: [String: String]?
        
        public init(
            id: String,
            name: String?,
            balance: String?,
            currencyCode: String?,
            additions: [String : String]?
        ) {
            self.id = id
            self.name = name
            self.balance = balance
            self.currencyCode = currencyCode
            self.additions = additions
        }
    }
}
