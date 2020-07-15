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
    @IBOutlet private weak var amountView: AmountView?
    @IBOutlet private weak var paymentMethodsView: PaymentMethodsView?
    @IBOutlet private weak var banksView: BanksView?
    @IBOutlet private weak var installmentsView: InstallmentsView?
    @IBOutlet private weak var confirmView: ConfirmView?
    @IBOutlet private weak var successView: SuccessView?
    @IBOutlet private weak var errorView: ErrorView?

    private var amountViewModel: MainModels.AmountViewModel? {
        didSet {
            updateViews()
        }
    }

    private var paymentMethodsViewModel: MainModels.PaymentMethodsViewModel? {
        didSet {
            updateViews()
        }
    }

    private var banksViewModel: MainModels.BanksViewModel? {
        didSet {
            updateViews()
        }
    }

    private var installmentsViewModel: MainModels.InstallmentsViewModel? {
        didSet {
            updateViews()
        }
    }

    private var confirmViewModel: MainModels.ConfirmViewModel? {
        didSet {
            updateViews()
        }
    }

    private var successViewModel: MainModels.SuccessViewModel? {
        didSet {
            updateViews()
        }
    }

    private var errorViewModel: MainModels.ErrorViewModel? {
        didSet {
            updateViews()
        }
    }

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
            amountViewModel = viewModel
        case .paymentMethods(let viewModel):
            paymentMethodsViewModel = viewModel
        case .banks(let viewModel):
            banksViewModel = viewModel
        case .installments(let viewModel):
            installmentsViewModel = viewModel
        case .confirm(let viewModel):
            confirmViewModel = viewModel
        case .success(let viewModel):
            successViewModel = viewModel
        case .error(let viewModel):
            errorViewModel = viewModel
        }
    }

    func presentInitialState(viewModel: MainModels.AmountViewModel) {
        self.amountViewModel = viewModel
    }
}

private extension MainViewController {
    func updateViews() {
        amountView?.isHidden = amountViewModel == nil
        paymentMethodsView?.isHidden = paymentMethodsViewModel == nil
        banksView?.isHidden = banksViewModel == nil
        installmentsView?.isHidden = installmentsViewModel == nil
        confirmView?.isHidden = confirmViewModel == nil
        successView?.isHidden = successViewModel == nil
        errorView?.isHidden = errorViewModel == nil
    }
    func clearViewModels() {
        amountViewModel = nil
        paymentMethodsViewModel = nil
        banksViewModel = nil
        installmentsViewModel = nil
        confirmViewModel = nil
        successViewModel = nil
        errorViewModel = nil
    }
}
