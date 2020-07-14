//
//  EnpointsTests.swift
//  PaymentToolTests
//
//  Created by Boris Sortino on 14/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import XCTest
@testable import PaymentTool

class EnpointsTests: XCTestCase {

    func testCreatePaymentsEndpoint() {
        guard
            let sutEndpoint = Endpoints.paymentMethods.endpoint?.absoluteString else {
                XCTFail("Unable to unwrap")
                return
        }
        let endpointString = APIConstants.Endpoints.paymentMethods
        let publicKey = "\(APIConstants.Parameters.publicKey)=\(APIConstants.apiKey())"

        XCTAssert(sutEndpoint.contains(endpointString),
                  "Endpoint should contain endpoint base url.")
        XCTAssert(sutEndpoint.contains(publicKey),
                  "Endpoint must contain the public key.")
    }

    func testCreateCardIssuersEndpoint() {
        guard
            let sutEndpoint = Endpoints.cardIssuers("1").endpoint?.absoluteString else {
                XCTFail("Unable to unwrap")
                return
        }
        let endpointString = APIConstants.Endpoints.cardIssuers
        let publicKey = "?\(APIConstants.Parameters.publicKey)=\(APIConstants.apiKey())"
        let queryPaymentMethodId = "&\(APIConstants.Parameters.paymentMethodId)=1"

        XCTAssert(sutEndpoint.contains(endpointString),
                  "Endpoint should contain endpoint base url.")
        XCTAssert(sutEndpoint.contains(publicKey),
                  "Endpoint must contain the public key.")
        XCTAssert(sutEndpoint.contains(queryPaymentMethodId),
                  "Endpoint must have the payment method query")
    }

    func testCreateInstallmentsEndpoint() {
        guard
            let sutEndpoint = Endpoints
                .installments(amount: "10",
                              methodId: "1",
                              issuerId: "1")
                .endpoint?
                .absoluteString else {
                    XCTFail("Unable to unwrap")
                    return
        }
        let endpointString = APIConstants.Endpoints.installments
        let publicKey = "\(APIConstants.Parameters.publicKey)=\(APIConstants.apiKey())"
        let queryAmount = "\(APIConstants.Parameters.amount)=10"
        let queryPaymentMethodId = "\(APIConstants.Parameters.paymentMethodId)=1"
        let queryIssuerId = "\(APIConstants.Parameters.issuerId)=1"

        XCTAssert(sutEndpoint.contains(endpointString),
                  "Endpoint should contain endpoint base url.")
        XCTAssert(sutEndpoint.contains(publicKey),
                  "Endpoint must contain the public key.")
        XCTAssert(sutEndpoint.contains(queryAmount),
                  "Endpoint must have amount query")
        XCTAssert(sutEndpoint.contains(queryPaymentMethodId),
                  "Endpoint must have the payment method query")
        XCTAssert(sutEndpoint.contains(queryIssuerId),
                  "Endpoint must have the issuer id query")
    }
}
