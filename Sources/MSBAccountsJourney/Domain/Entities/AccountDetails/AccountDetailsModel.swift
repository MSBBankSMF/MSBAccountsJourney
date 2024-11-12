//
//  AccountDetailsModel.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

extension MSBAccountsJourney {
    // swiftlint:disable function_body_length type_body_length
    public struct AccountDetailsModel {
        public let id: String
        public let productId: String
        public let productKindName: String?
        public let legalEntityIds: [String]?
        public let productTypeName: String?
        public let externalProductId: String?
        public let externalArrangementId: String?
        
        public init(
            id: String,
            productId: String,
            productKindName: String?,
            legalEntityIds: [String]?,
            productTypeName: String?,
            externalProductId: String?,
            externalArrangementId: String?
        ) {
            self.id = id
            self.productId = productId
            self.productKindName = productKindName
            self.legalEntityIds = legalEntityIds
            self.productTypeName = productTypeName
            self.externalProductId = externalProductId
            self.externalArrangementId = externalArrangementId
        }
    }
    // swiftlint:enable function_body_length type_body_length
}
