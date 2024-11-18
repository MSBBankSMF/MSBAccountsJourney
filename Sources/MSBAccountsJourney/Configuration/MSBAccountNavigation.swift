//
//  MSBAccountNavigation.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//

public protocol MSBAccountNavigation: AnyObject {
    @MainActor func routeToAccountList()
    @MainActor func routeToAccountDetail(arrangementId: String)
}
