//
//  Endpoints.swift
//  PaymentTool
//
//  Created by Boris Sortino on 13/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation

enum Endpoints {
    case paymentMethods
    case cardIssuers(String)
    case installments(amount: String, methodId: String, issuerId: String)

    var endpoint: URL? {
        switch self {
        case .paymentMethods:
            return getUrl()
        case .cardIssuers(let paymentMethodId):
            return
                getUrl(
                    with: [
                        APIConstants.Parameters.paymentMethodId: paymentMethodId
                ])
        case .installments(let amount, let methodId, let issuerId):
            return
                getUrl(with: [
                    APIConstants.Parameters.amount: amount,
                    APIConstants.Parameters.paymentMethodId: methodId,
                    APIConstants.Parameters.issuerId: issuerId
                ])
        }
    }
    private func getUrl(with parameters: [String: String] = [:]) -> URL? {
        var components: URLComponents?
        switch self {
        case .paymentMethods:
            components = URLComponents(string: APIConstants.Endpoints.paymentMethods)
        case .cardIssuers:
            components = URLComponents(string: APIConstants.Endpoints.cardIssuers)
        case .installments:
            components = URLComponents(string: APIConstants.Endpoints.installments)
        }
        guard
            var unwrappedComponents = components else {
                return nil
        }
        unwrappedComponents.queryItems = [
            URLQueryItem(name: APIConstants.Parameters.publicKey,
                         value: APIConstants.apiKey())
        ]
        for (key, parameter) in parameters {
            unwrappedComponents
                .queryItems?
                .append(URLQueryItem(name: key,
                                     value: parameter))
        }
        return unwrappedComponents.url
    }
}
