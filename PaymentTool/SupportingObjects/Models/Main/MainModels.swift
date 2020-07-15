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
        // Data from View to Interactor/Workers
    }
    struct Response {
        let state: State
    }
    struct ViewModels {
        // Modeled view Data from Presenter to View
    }
    struct AmountViewModel {
        let title: String
    }
    struct PaymentMethodsViewModel {
        let title: String
    }
    struct BanksViewModel {
        let title: String
    }
    struct InstallmentsViewModel {
        let title: String
    }
    struct ConfirmViewModel {
        let title: String
    }
    struct SuccessViewModel {
        let title: String
    }
    struct ErrorViewModel {
        let title: String
    }
}
