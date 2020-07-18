//
//  PaymentMethodsWorker.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation

protocol PaymentMethodsWorker {
    func getPaymentMethods(completionHandler: @escaping (Result<[PaymentMethodsDataModel], Error>) -> Void)
}

extension Worker: PaymentMethodsWorker {
    func getPaymentMethods(completionHandler: @escaping (Result<[PaymentMethodsDataModel], Error>) -> Void) {
        guard let endpoint = Endpoints.paymentMethods.endpoint else {
            return
        }
        URLSession
            .shared
            .retrieveData(with: endpoint) { (data: [PaymentMethodsDataModel]?, _, error) in
                if let unwrappedData = data {
                    completionHandler(.success(unwrappedData))
                    return
                }
                if let unwrappedError = error {
                    completionHandler(.failure(unwrappedError))
                }
        }
    }
}
