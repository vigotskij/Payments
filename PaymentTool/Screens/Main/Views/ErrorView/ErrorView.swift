//
//  ErrorView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class ErrorView: UIView, NibLoadable {
    private var viewModel: MainModels.ErrorViewModel?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func update(viewModel: MainModels.ErrorViewModel?) {
        self.viewModel = viewModel
    }
}

private extension ErrorView {
    func commonInit() {
        loadNibContent()
    }
}

extension ErrorView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
