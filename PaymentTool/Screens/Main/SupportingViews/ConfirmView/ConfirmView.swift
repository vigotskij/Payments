//
//  ConfirmView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class ConfirmView: UIView, NibLoadable {
    private var viewModel: Confirm.ViewModel?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func update(viewModel: Confirm.ViewModel?) {
        self.viewModel = viewModel
    }
}

private extension ConfirmView {
    func commonInit() {
        loadNibContent()
    }
}

extension ConfirmView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
