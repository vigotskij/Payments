//
//  PaymentMethodsModels.swift
//  PaymentTool
//
//  Created by Boris Sortino on 16/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum PaymentMethods {
    struct Request {
        let selectedMethod: Int
    }
    struct Response {
        let methods: [PaymentMethodsDataModel]
    }
    struct ViewModel {
        let title = "Elija un método de pago"
        let methods: [PaymentMethodViewModel]

        init(from response: Response) {
            methods = response.methods.map({ PaymentMethodViewModel(name: $0.name)})
        }
    }
}

struct PaymentMethodsDataModel: Decodable, Hashable {
    let methodId: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case methodId = "id"
        case name
    }
}

struct PaymentMethodViewModel {
    let name: String
}
