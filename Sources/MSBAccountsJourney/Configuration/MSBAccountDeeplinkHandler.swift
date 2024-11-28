//
//  MSBAccountDeeplinkHandler.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import Foundation
import MSBDeeplink
import Resolver

public final class MSBAccountDeeplinkHandler: DeeplinkHandlerProtocol {    
    public init() {}
    
    public func canOpenURL(_ url: URL) -> Bool {
        let path = url.absoluteString
        
        return DeeplinkPath.Account.allCases.contains {
            path.contains($0.rawValue)
        }
    }
    
    @MainActor
    public func openURL(_ url: URL) {
        guard
            let accountCoordinator = Resolver.optional(MSBAccountNavigation.self),
            let validPath = DeeplinkPath.Account(url: url)
        else {
            return
        }
        switch validPath {
        case .accountList:
            accountCoordinator.routeToAccountList()
        }
    }

}

extension DeeplinkPath {
    public enum Account: String, CaseIterable, Sendable {
        case accountList = "/accountList"
        
        public static let allCases: [Account] = [
            .accountList
        ]
        
        public init?(url: URL) {
            let path = url.path
            if path == DeeplinkPath.Account.accountList.rawValue {
                self = .accountList
                return
            }

            return nil
        }
    }
    
}
