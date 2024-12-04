//
//  ArrangementManagerTargetBuilder.swift
//  MSBAccountsJourney
//
//  Created by doandat on 3/12/24.
//

import Foundation
import Moya

public struct ArrangementManagerTargetBuilder: TargetType, AccessTokenAuthorizable {
    let operation: OperationType
    
    public var baseURL: URL
    public var path: String {
        switch operation {
        case .getProductSummary:
            return "/api/arrangement-manager/client-api/v2/productsummary"            
        case let .getArrangementById(arrangementId):
            return "/api/arrangement-manager/client-api/v2/arrangements/\(arrangementId)"
            
        }
    }
    
    public var method: Moya.Method {
        switch operation {
        case .getProductSummary:
            return .get
        case .getArrangementById:
            return .get
        }
    }
    
    public var task: Task {
        switch operation {
        case .getProductSummary, .getArrangementById:
            return .requestPlain
            
        }
    }
    
    public var validationType: ValidationType {
        .none
    }
    
    public var authorizationType: AuthorizationType? {
        switch operation {
        case .getProductSummary, .getArrangementById:
            return .bearer
        }
    }
    
    public var headers: [String: String]? {
        return [:]
    }
}

extension ArrangementManagerTargetBuilder {
    enum OperationType {
        case getProductSummary
        case getArrangementById(arrangementId: String)
    }
}
