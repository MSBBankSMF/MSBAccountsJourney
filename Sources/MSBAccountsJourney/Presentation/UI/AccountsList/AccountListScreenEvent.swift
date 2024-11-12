//
//  AccountListScreenEvent.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//

import Foundation

/// All possible events from the AccountsListScreen
public enum AccountListScreenEvent {
    /// Load accounts
    case getAccounts
    /// Refresh accounts loaded
    case refresh
}

extension AccountListScreenEvent: Equatable {}
