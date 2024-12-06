//
//  MainView.swift
//  MSBAccountsJourneyExample
//
//  Created by datdv1 on 6/12/24.
//

import SwiftUI
import Combine
import Resolver
import MSBCoreUI
import MSBFoundation
import MSBAccountsJourney
import MSBDeeplink

struct MainView: MSBView {
    var identifier: String = String(describing: Self.self)
    
//    var navigation: MSBDashboardNavigation? = Resolver.optional(MSBDashboardNavigation.self)
        
    var body: some View {
        VStack {
            Button(action: {
                guard let deeplink = DeeplinkHelper.makeDeeplink(type: DeeplinkPath.Account.accountList) else { return }
                DeepLinksService.shared.handleURL(deeplink)
            }) {
                Text("Start")
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }
            
            Button(action: {
                // Handle revoke action
                let session = Resolver.optional(MSBSessionProtocol.self)
                session?.revoke()
            }) {
                Text("Revoke")
            }.padding(.top, 20)
            
        }
        .onAppear {
            setupBindings()
        }
    }
    
    private func setupBindings() {
        // Setup your Combine bindings here
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
