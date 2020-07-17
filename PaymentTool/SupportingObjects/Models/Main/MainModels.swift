//
//  MainModels.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum MainModels {
    enum State {
        case amount(AmountViewModel)
        case paymentMethods(PaymentMethodsViewModel)
        case banks(BanksViewModel)
        case installments(InstallmentsViewModel)
        case confirm(ConfirmViewModel)
        case success(SuccessViewModel)
        case error(ErrorViewModel)
    }

    struct Request {
        let amount: String
    }
    struct Response {
        let state: State
        let amount: Double
    }

    struct AmountViewModel {
        let title = "Ingrese cantidad"
        let amount: String
    }

    struct PaymentMethodsViewModel {
        let title = "Elija un método de pago"
    }

    struct BanksViewModel {
        let title = "Elija un banco"
    }

    struct InstallmentsViewModel {
        let title = "Installments?"
    }

    struct ConfirmViewModel {
        let title = "Confirme los datos"
    }

    struct SuccessViewModel {
        let title: String
    }

    struct ErrorViewModel {
        let title: String
    }
}
