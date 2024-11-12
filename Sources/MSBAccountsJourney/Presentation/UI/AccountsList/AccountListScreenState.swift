//
//  AccountListScreenState.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import Foundation

public enum AccountListScreenState {
    /// Loading / searching
    case loading
    /// Idle state
    case loaded
    /// Empty results
    case emptyResults
    /// Error has been encountered
    case hasError
}
