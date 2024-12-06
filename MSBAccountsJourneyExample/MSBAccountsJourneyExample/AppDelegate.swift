//
//  AppDelegate.swift
//  MSBAccountsJourneyExample
//
//  Created by datdv1 on 6/12/24.
//

import UIKit
import PluggableAppDelegate
import Resolver
import MSBLogger
import MSBFoundation
#if DEBUG
import Atlantis
#endif

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
    override var services: [ApplicationService] {
        let services: [ApplicationService] = [
            DIServices(),
            WindowManagementService()
        ]
        #if DEBUG
        Atlantis.start()
        #endif
        return services
    }

    override init() {
        super.init()
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }

    func getRegisteredService<T: ApplicationService>(class _: T.Type) -> T? {
        return self.services.first(where: { $0 is T }) as? T
    }
}
