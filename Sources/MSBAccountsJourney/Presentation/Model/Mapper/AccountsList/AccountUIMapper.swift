//
//  AccountUIMapper.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import Foundation

extension MSBAccountsJourney.AccountsSummary {
    
    func toMapUI() -> AccountUIModel {
        let currency: Currency? = {
            guard let currencyCode, let balance else {
                return nil
            }
            return Currency(amount: balance, currencyCode: currencyCode)
        }()
        return AccountUIModel(
            id: id,
            name: name,
            balance: currency
        )
    }
}
