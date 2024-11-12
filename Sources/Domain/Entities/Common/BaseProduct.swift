//
//  BaseProduct.swift
//  MSBAccountsJourney
//
//  Created by doandat on 11/11/24.
//

import Foundation

extension MSBAccountsJourney {
    /// Base product for sub-arrangements
    public struct BaseProduct: Equatable {
        /// Reference to the product of which the arrangement is an instantiation.
        public let identifier: String?
        /// Name of the account
        public let name: String?
        /// Represents an arrangement by it's correct naming identifier. It could be account alias or user alias depending on the journey
        /// selected by the financial institution. If none of those is set, the arrangement name will be used.
        public let displayName: String?
        /// Defines if transfer to another party is allowed.
        public let externalTransferAllowed: Bool?
        /// Defines if cross currency transfer is allowed
        public let crossCurrencyAllowed: Bool?
        /// The label/name that is used for the respective product kind
        public let productKindName: String?
        /// The label/name that is used to label a specific product type.
        public let productTypeName: String?
        /// The name that can be assigned by the bank to label the arrangement.
        public let bankAlias: String?
        /// Indicate if the account is regular or external.
        public let sourceId: String?
        /// Indicator whether to show or hide the arrangement on the view.
        public let visible: Bool?
        /// Account opening date
        public let accountOpeningDate: Date?
        /// Last date of parameter update for the arrangement.
        public let lastUpdateDate: Date?
        
        public init(
            identifier: String?,
            name: String?,
            displayName: String?,
            externalTransferAllowed: Bool?,
            crossCurrencyAllowed: Bool?,
            productKindName: String?,
            productTypeName: String?,
            bankAlias: String?,
            sourceId: String?,
            visible: Bool?,
            accountOpeningDate: Date?,
            lastUpdateDate: Date?
        ) {
            self.identifier = identifier
            self.name = name
            self.displayName = displayName
            self.externalTransferAllowed = externalTransferAllowed
            self.crossCurrencyAllowed = crossCurrencyAllowed
            self.productKindName = productKindName
            self.productTypeName = productTypeName
            self.bankAlias = bankAlias
            self.sourceId = sourceId
            self.visible = visible
            self.accountOpeningDate = accountOpeningDate
            self.lastUpdateDate = lastUpdateDate
        }
        
    }
}
