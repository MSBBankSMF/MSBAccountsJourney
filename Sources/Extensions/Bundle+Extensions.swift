//
//  Bundle+Extensions.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

private final class MSBAccountsJourneyBundleToken { }

extension Bundle {
    public static var accountsJourney: Bundle? {
        let bundle = Bundle(for: MSBAccountsJourneyBundleToken.self)
        
        guard let resourceUrl = bundle.url(forResource: "MSBAccountsJourneyAssets", withExtension: "bundle"),
              let resourceBundle = Bundle(url: resourceUrl) else {
            return bundle
        }
        
        return resourceBundle
    }
}
