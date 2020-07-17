//
//  PaymentMethodsWorker.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

protocol PaymentMethodsWorker {
    func getPaymentMethods(completionHandler: (Result<[PaymentMethodsDataModel], Error>) -> Void)
}

extension Worker: PaymentMethodsWorker {
    func getPaymentMethods(completionHandler: (Result<[PaymentMethodsDataModel], Error>) -> Void) {}
}
