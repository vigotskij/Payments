//
//  MainContracts.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

// MARK: - init helper
protocol MainConfigurator: Configurator {
    func configure(with viewController: MainViewController)
}
// MARK: - Routing
protocol MainRouter: Router {}
// MARK: - Inner structure
protocol MainInteractor: Interactor {
    func viewDidLoad()
    func process(amount: Amount.Request)
    func process(paymentMethod: PaymentMethods.Request)
    func process(bank: Banks.Request)
    func process(installment: Installments.Request)
    func process(confirmed: Bool)
    func backButtonPressed()
}
protocol MainPresenter: Presenter {
    func presentInitialState()
    func presentAmountView(with response: Amount.Response)
    func presentPaymentMethodsView(with response: PaymentMethods.Response)
    func presentBanksView(with response: Banks.Response)
    func presentInstallmentsView(with response: Installments.Response)
    func presentConfirmView(with response: Confirm.Response)
    func presentSuccessView(with response: Success.Response)
    func presentErrorView(with response: ErrorModels.Response)
}
protocol MainView: View {
    var output: MainInteractor? { get set }
    var router: MainRouter? { get set }

    func presentAmountView(with viewModel: Amount.ViewModel)
    func presentPaymentView(with viewModel: PaymentMethods.ViewModel)
    func presentBanksView(with viewModel: Banks.ViewModel)
    func presentInstallmentsView(with viewModel: Installments.ViewModel)
    func presentConfirmView(with viewModel: Confirm.ViewModel)
    func presentSuccessView(with viewModel: Success.ViewModel)
    func presentErrorView(with viewModel: ErrorModels.ViewModel)
}
