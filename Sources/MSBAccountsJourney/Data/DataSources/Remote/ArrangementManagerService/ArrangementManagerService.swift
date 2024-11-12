//
//  ArrangementManagerService.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//

import Foundation
@preconcurrency import Moya
import MSBNetworking

actor ArrangementManagerService {
    public typealias Target = ArrangementManagerTargetBuilder

    @MainActor
    public let moyaProvider: MoyaProvider<Target>
    private let baseURL: URL

    @MainActor
    public init(
        baseURL: URL,
        moyaProvider: MoyaProvider<Target>
    ) {
        self.moyaProvider = moyaProvider
        self.baseURL = baseURL
    }

}

extension ArrangementManagerService: AccountRemoteDataSource {
    public func getArrangementById(arrangementId: String) async throws -> AccountDetailDTO {
        let target = Target(
            operation: .getArrangementById(arrangementId: arrangementId),
            baseURL: baseURL
        )

        let result: AccountDetailDTO = try await moyaProvider.performRequest(target: target)
        return result
    }

    public func getAccountSummary() async throws -> [AccountSummaryDTO] {
        let target = Target(
            operation: .getProductSummary,
            baseURL: baseURL
        )

        let result: [AccountSummaryDTO] = try await moyaProvider.performRequest(target: target)
        return result
    }
}


