//
//  FakeArrangementManagerService.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import Foundation

public final class FakeArrangementManagerService: AccountRemoteDataSource {
    public init() {}
    
    public func getArrangementById(arrangementId: String) async throws -> AccountDetailDTO {
        return AccountDetailDTO(
            id: "1",
            productId: "12",
            productKindName: "Dat",
            legalEntityIds: nil,
            productTypeName: nil,
            externalProductId: nil,
            externalArrangementId: nil
        )
    }
    
    public func getAccountSummary() async throws -> [AccountSummaryDTO] {
        return [
            AccountSummaryDTO(id: "1", name: "Dat", balance: "1000", currencyCode: "VND", additions: nil)
        ]
    }
}
