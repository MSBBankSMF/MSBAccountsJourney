//
//  Configuration.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation
import Resolver
import MSBFoundation
import Moya

extension MSBAccountsJourney {
    public struct Configuration {
        
        public init() {}
        
        @MainActor
        public func register() {
            let arrangementManagerService: ArrangementManagerService = {
                guard let config = Resolver.optional(MSBBackbaseConfiguration.self),
                      let authPlugin = Resolver.optional(AccessTokenPlugin.self) else {
                    fatalError("Backbase Config not found")
                }
                let moyaProvider: MoyaProvider<ArrangementManagerService.Target> = {
                    return .init(
                        session: .init(configuration: config.securitySessionConfiguration),
                        plugins: [authPlugin]
                    )
                }()
                

                return ArrangementManagerService(
                    baseURL: config.baseURL,
                    moyaProvider: moyaProvider
                )
            }()

            Resolver.register {
                AccountsListSummaryUseCaseImp(
                    repository: AccountRepository(remoteDataSource: arrangementManagerService)
                ) as AccountsListUseCase
            }
        }
    }
}

