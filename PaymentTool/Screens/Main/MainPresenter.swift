//
//  MainPresenter.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class MainPresenterImplementation {
    private weak var output: MainView?

    init(output: MainView) {
        self.output = output
    }
}

extension MainPresenterImplementation: MainPresenter {
    func presentInitialState() {
        output?.presentAmountView(with: .init(amount: ""))
    }

    func presentAmountView(with response: Amount.Response) {

    }

    func presentPaymentMethodsView(with response: PaymentMethods.Response) {

    }

    func presentBanksView(with response: Banks.Response) {

    }

    func presentInstallmentsView(with response: Installments.Response) {

    }

    func presentConfirmView(with response: Confirm.Response) {

    }

    func presentSuccessView(with response: Success.Response) {

    }

    func presentErrorView(with response: ErrorModels.Response) {
    }
}
