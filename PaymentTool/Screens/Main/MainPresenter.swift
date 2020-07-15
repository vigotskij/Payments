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
    func updateView(with response: MainModels.Response) {
        output?.updateView(with: response.state)
    }
    func presentInitialState() {
        output?.presentInitialState(viewModel: .init(title: "start"))
    }
}
