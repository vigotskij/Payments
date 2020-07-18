//
//  MainInteractor.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class MainInteractorImplementation {
    private var output: MainPresenter?
    private var state: MainModels.DataState = .amount
    private var paymentMethods: [PaymentMethodsDataModel]? {
        didSet {
            guard let paymentMethods = paymentMethods else {
                return
            }
            output?.presentPaymentMethodsView(with: .init(methods: paymentMethods))
        }
    }
    private var request: MainModels.Request?
    private var worker: PaymentMethodsWorker = Worker()

    init(output: MainPresenter) {
        self.output = output
    }
}

extension MainInteractorImplementation: MainInteractor {
    func viewDidLoad() {
        output?.presentInitialState()
    }

    func process(amount: Amount.Request) {
        request = MainModels.Request(rawAmount: amount.amount, paymentMethodId: "")
        worker.getPaymentMethods { [weak self] result in
            switch result {
            case .success(let retrievedData):
                self?.state = .paymentMethods
                self?.paymentMethods = retrievedData
            case .failure(let error):
                print(error)
            }
        }
    }
    func process(paymentMethod: PaymentMethods.Request) {
        guard
            let methodId = paymentMethods?[paymentMethod.selectedMethod]
                .methodId else {
            return
        }
        request?.paymentMethodId = methodId
        // TODO: call banks with method id
        // TODO: present banks view
    }
    func process(bank: Banks.Request) {}
    func process(installment: Installments.Request) {}
    func process(confirmed: Bool) {}
    func backButtonPressed() {
        switch state.previousState() {
        case .amount:
            state = .amount
            let response = Amount.Response(amount: request?.rawAmount ?? "")
            output?.presentAmountView(with: response)
        case .paymentMethods:
            state = .paymentMethods
            guard let paymentMethods = paymentMethods else {
                return
            }
            output?.presentPaymentMethodsView(with: .init(methods: paymentMethods))
        default:
            return
        }
    }
}
