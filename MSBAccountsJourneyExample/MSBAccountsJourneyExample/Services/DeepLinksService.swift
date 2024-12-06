//
//  DeepLinksService.swift
//  MSBAccountsJourneyExample
//
//  Created by datdv1 on 6/12/24.
//

import MSBDeeplink
import Foundation
import UIKit
import Resolver
import MSBAccountsJourney

final class DeepLinksService: DeeplinkCoordinatorProtocol {
    static let shared = DeepLinksService()
        
    var rootViewController: UINavigationController? {
        didSet {
            guard let rootViewController else { return }
            Resolver.register { MSBAccountCoordinator(rootViewController: rootViewController) as MSBAccountNavigation }

        }
    }
    
    private lazy var handlers: [DeeplinkHandlerProtocol] = [
        MSBAccountDeeplinkHandler()
    ]
    
    private var deepLinkCoordinator: DeeplinkCoordinator {
        let v = DeeplinkCoordinator(handlers: handlers)
        return v
    }

    @discardableResult
    func handleURL(_ url: URL) -> Bool {
        return deepLinkCoordinator.handleURL(url)
    }

    func canOpenURL(_ url: URL) -> Bool {
        return deepLinkCoordinator.canOpenURL(url)
    }


}
