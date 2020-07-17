//
//  MainInteractor.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class MainInteractorImplementation {
    private var output: MainPresenter?
    private var state: MainModels.State = .amount(.init(amount: "$ 0.00"))
    private var request: MainModels.Request?

    init(output: MainPresenter) {
        self.output = output
    }
}

extension MainInteractorImplementation: MainInteractor {
    func viewDidLoad() {
        output?.presentInitialState()
    }
    func backButtonPressed() {

    }
    func process(amount: String) {
        request = MainModels.Request(amount: amount)
    }
}
