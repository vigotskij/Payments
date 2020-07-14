//
//  APIConstants.swift
//  PaymentTool
//
//  Created by Boris Sortino on 13/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum APIConstants {
    static func apiKey() -> String {
        return "TEST-1ca87017-aea3-4d6b-b567-39485dbacd09"
    }
    struct Endpoints {
        static let base = "https://api.mercadopago.com/v1/"
        static let paymentMethods = "\(base)payment_methods"
        static let cardIssuers = "\(paymentMethods)/card_issuers"
        static let installments = "\(paymentMethods)/installments"
    }
    struct Parameters {
        static let publicKey = "public_key"
        static let paymentMethodId = "payment_method_id"
        static let amount = "amount"
        static let issuerId = "issuer_id"
    }
}
