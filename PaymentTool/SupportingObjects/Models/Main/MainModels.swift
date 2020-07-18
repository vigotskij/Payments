//
//  MainModels.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum MainModels {
    enum DataState {
        case amount
        case paymentMethods
        case banks
        case installments
        case confirm
        case success
        case error

        func previousState() -> DataState {
            switch self {
            case .paymentMethods:
                return .amount
            case .banks:
                return .paymentMethods
            case .installments:
                return .banks
            case .confirm:
                return .installments
            default:
                return .error
            }
        }
    }

    struct Request {
        var rawAmount: String
        var paymentMethodId: String
    }
}
