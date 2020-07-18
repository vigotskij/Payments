//
//  InstallmentsView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class InstallmentsView: UIView, NibLoadable {
    private var viewModel: Installments.ViewModel?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func update(viewModel: Installments.ViewModel?) {
        self.viewModel = viewModel
    }
}

private extension InstallmentsView {
    func commonInit() {
        loadNibContent()
    }
}

extension InstallmentsView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
