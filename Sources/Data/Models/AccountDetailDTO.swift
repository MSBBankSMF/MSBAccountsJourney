//
//  AccountDetailDTO.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

public struct AccountDetailDTO: Decodable {
    public let id: String
    public let productId: String
    public let productKindName: String?
    public let legalEntityIds: [String]?
    public let productTypeName: String?
    public let externalProductId: String?
    public let externalArrangementId: String?
    
    func toDomainModel() -> MSBAccountsJourney.AccountDetailsModel {
        return MSBAccountsJourney.AccountDetailsModel(
            id: id,
            productId: productId,
            productKindName: productKindName,
            legalEntityIds: legalEntityIds,
            productTypeName: productTypeName,
            externalProductId: externalProductId,
            externalArrangementId: externalArrangementId
        )
    }
}
