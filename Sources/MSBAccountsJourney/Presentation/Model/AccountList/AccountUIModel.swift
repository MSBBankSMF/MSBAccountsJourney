//
//  AccountUIModel.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//

import UIKit

public struct AccountUIModel: Sendable {
    /// Unique id
    let id: String?
    /// Account name
    let name: String?
    /// Account balance
    let balance: Currency?
    
    var balanceFormatted: String? {
        guard let amount = balance?.amount, let currencyCode = balance?.currencyCode else {
            return nil
        }
        return "\(amount) \(currencyCode)"
    }
    
    public init(
        id: String? = nil,
        name: String? = nil,
        balance: Currency? = nil
    ) {
        self.id = id
        self.name = name
        self.balance = balance
    }
}

public struct Currency: Sendable, Equatable {
    /// Balance value as a string.
    var amount: String
    /// The alpha-3 code (complying with ISO 4217) of the currency that qualifies the amount.
    var currencyCode: String
    
    /// Initializer for the ``Currency`` DTO
    /// - Parameters:
    ///   - amount: balance as a string
    ///   - currencyCode: alpha-3 code (complying with ISO 4217) of the currency that qualifies the amount
    public init(amount: String, currencyCode: String) {
        self.amount = amount
        self.currencyCode = currencyCode
    }
    
    public init(amount: String?, currencyCode: String?) {
        if let amount, let currencyCode {
            self.amount = amount
            self.currencyCode = currencyCode
        } else {
            self.amount = "0"
            self.currencyCode = ""
        }
    }
}
