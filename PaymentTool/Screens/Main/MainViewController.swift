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
                self?.output?.process(amount: amount)
            }
        }
    }
    @IBOutlet private weak var paymentMethodsView: PaymentMethodsView?
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
    func updateView(with state: MainModels.State) {
        clearViewModels()
        switch state {
        case .amount(let viewModel):
            amountView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
            amountView?.becomeFirstResponder()
        case .paymentMethods(let viewModel):
            paymentMethodsView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
        case .banks(let viewModel):
            banksView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
        case .installments(let viewModel):
            installmentsView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
        case .confirm(let viewModel):
            confirmView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
        case .success(let viewModel):
            successView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
        case .error(let viewModel):
            errorView?.update(viewModel: viewModel)
            navigationBar?.setTitle(with: viewModel.title)
        }
        updateViews()
    }

    func presentInitialState(viewModel: MainModels.AmountViewModel) {
        amountView?.update(viewModel: viewModel)
        navigationBar?.setTitle(with: viewModel.title)
        amountView?.becomeFirstResponder()
        updateViews()
    }
}

extension MainViewController: MainNavigationBarDelegate {
    func shouldHideBackButton() -> Bool {
        return !(amountView?.shouldHide() ?? true)
    }

    func backButtonPressed() {
        output?.backButtonPressed()
    }
}
private extension MainViewController {
    func updateViews() {
        amountView?.isHidden = amountView?.shouldHide() ?? true
        paymentMethodsView?.isHidden = paymentMethodsView?.shouldHide() ?? true
        banksView?.isHidden = banksView?.shouldHide() ?? true
        installmentsView?.isHidden = installmentsView?.shouldHide() ?? true
        confirmView?.isHidden = confirmView?.shouldHide() ?? true
        successView?.isHidden = successView?.shouldHide() ?? true
        errorView?.isHidden = errorView?.shouldHide() ?? true
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
