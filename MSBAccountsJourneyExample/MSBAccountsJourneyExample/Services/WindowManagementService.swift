//
//  WindowManagementService.swift
//  MSBAccountsJourneyExample
//
//  Created by datdv1 on 6/12/24.
//
import Combine
import Foundation
import PluggableAppDelegate
import UIKit
import MSBLogger
import MSBFoundation
import Resolver
import MSBDeeplink
import MSBAccountsJourney
import MSBCoreUI

final class WindowManagementService: NSObject, ApplicationService {
    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions options: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        setupRootViewController()
        return true
    }
    
    private func setupRootViewController() {
        let pVC = MSBHostingController(rootView: MainView())
        let navigationController = UINavigationController(rootViewController: pVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        DeepLinksService.shared.rootViewController = navigationController
    }
}
