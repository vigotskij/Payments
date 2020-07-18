//
//  PaymentMethodsView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class PaymentMethodsView: UIView, NibLoadable {
    private var viewModel: PaymentMethods.ViewModel?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func update(viewModel: PaymentMethods.ViewModel?) {
        self.viewModel = viewModel
    }
}

private extension PaymentMethodsView {
    func commonInit() {
        loadNibContent()
    }
}

extension PaymentMethodsView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
