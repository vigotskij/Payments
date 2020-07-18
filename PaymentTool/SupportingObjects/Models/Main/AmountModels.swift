//
//  AmountModels.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum Amount {
    struct Request {
        let amount: String
    }
    struct Response {
        let amount: String
    }
    struct ViewModel {
        let title = "Ingrese cantidad"
        let amount: String
    }
}
