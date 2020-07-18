//
//  ViewController.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var output: MainInteractor?
    var router: MainRouter?
    var configurator: MainConfigurator = MainConfiguratorImplementation()

    // MARK: Outlets
    @IBOutlet private weak var navigationBar: MainNavigationBar? {
        didSet {
            navigationBar?.delegate = self
        }
    }
    @IBOutlet private weak var amountView: AmountView? {
        didSet {
            amountView?.didFinishedEnterAmount = { [weak self] amount in
                let request = Amount.Request(amount: amount)
                self?.output?.process(amount: request)
            }
        }
    }
    @IBOutlet private weak var paymentMethodsView: PaymentMethodsView? {
        didSet {
            paymentMethodsView?.delegate = self
        }
    }
    @IBOutlet private weak var banksView: BanksView?
    @IBOutlet private weak var installmentsView: InstallmentsView?
    @IBOutlet private weak var confirmView: ConfirmView?
    @IBOutlet private weak var successView: SuccessView?
    @IBOutlet private weak var errorView: ErrorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        output?.viewDidLoad()
    }
}

extension MainViewController: MainView {

    func presentAmountView(with viewModel: Amount.ViewModel) {
        amountView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        amountView?.becomeFirstResponder()
        updateViews()
    }

    func presentPaymentView(with viewModel: PaymentMethods.ViewModel) {
        clearViewModels()
        paymentMethodsView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        updateViews()
    }
    func presentBanksView(with viewModel: Banks.ViewModel) {
        clearViewModels()
        banksView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        updateViews()
    }
    func presentInstallmentsView(with viewModel: Installments.ViewModel) {
        clearViewModels()
        installmentsView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        updateViews()
    }
    func presentConfirmView(with viewModel: Confirm.ViewModel) {
        clearViewModels()
        confirmView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        updateViews()
    }
    func presentSuccessView(with viewModel: Success.ViewModel) {
        clearViewModels()
        successView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        updateViews()
    }

    func presentErrorView(with viewModel: ErrorModels.ViewModel) {
        clearViewModels()
        errorView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        updateViews()
    }
}

private extension MainViewController {
    func updateViews() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.amountView?.isHidden = self.amountView?.shouldHide() ?? true
            self.paymentMethodsView?.isHidden = self.paymentMethodsView?.shouldHide() ?? true
            self.banksView?.isHidden = self.banksView?.shouldHide() ?? true
            self.installmentsView?.isHidden = self.installmentsView?.shouldHide() ?? true
            self.confirmView?.isHidden = self.confirmView?.shouldHide() ?? true
            self.successView?.isHidden = self.successView?.shouldHide() ?? true
            self.errorView?.isHidden = self.errorView?.shouldHide() ?? true
        }
    }

    func clearViewModels() {
        amountView?.update(viewModel: nil)
        paymentMethodsView?.update(viewModel: nil)
        banksView?.update(viewModel: nil)
        installmentsView?.update(viewModel: nil)
        confirmView?.update(viewModel: nil)
        successView?.update(viewModel: nil)
        errorView?.update(viewModel: nil)
    }
}

// MARK: Delegate implementations
extension MainViewController: MainNavigationBarDelegate {
    func shouldHideBackButton() -> Bool {
        return !(amountView?.shouldHide() ?? true)
    }

    func backButtonPressed() {
        output?.backButtonPressed()
    }
}

extension MainViewController: PaymentMethodsViewDelegate {
    func nextButtonPressed(row: Int) {
        output?.process(paymentMethod: .init(selectedMethod: row))
    }
}
