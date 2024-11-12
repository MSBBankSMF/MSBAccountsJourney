//
//  AccountSummary.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

extension MSBAccountsJourney {
    public struct AccountsSummary: Equatable {
        public let additions: [String: String]?
        
        public init(additions: [String : String]?) {
            self.additions = additions
        }
    }
}
