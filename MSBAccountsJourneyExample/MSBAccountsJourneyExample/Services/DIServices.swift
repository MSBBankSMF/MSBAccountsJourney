//
//  DIServices.swift
//  MSBAccountsJourneyExample
//
//  Created by datdv1 on 6/12/24.
//

import Foundation
import PluggableAppDelegate
import UIKit
import Resolver
import MSBAccountsJourney
import MSBDeeplink
import Moya
import MSBFoundation

final class DIServices: NSObject, ApplicationService {
    override init() {
        super.init()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        defaultRegister()
        setupAccountsJourney()
        return true
    }
    
    func defaultRegister() {
        let config = MSBBackbaseConfiguration(
            baseURL: URL(string: "https://mock.apidog.com/m1/683076-655710-default")!,
            securitySessionConfiguration: .default
        )
        Resolver.register { config }
        let authPlugin = AccessTokenPlugin { _ in
            return ""
        }
        Resolver.register { authPlugin }

    }
    
    func setupAccountsJourney() {
        MSBAccountsJourney.Configuration().register()
//        Resolver.register {
//            AccountsListSummaryUseCaseImp(
//                repository: AccountRepository(remoteDataSource: FakeArrangementManagerService())
//            ) as AccountsListUseCase
//        }

    }

}
