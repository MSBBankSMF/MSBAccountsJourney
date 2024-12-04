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
    
    public func getAccountSummary() async throws -> [AccountSummaryDTO.AccountSummaryItemDTO] {
        return [
            AccountSummaryDTO.AccountSummaryItemDTO(id: "1", name: "Dat", availableBalance: "1000", currency: "VND", additions: nil)
        ]
    }
}
