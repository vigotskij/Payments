//
//  SuccessView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class SuccessView: UIView, NibLoadable {
    private var viewModel: Success.ViewModel?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func update(viewModel: Success.ViewModel?) {
        self.viewModel = viewModel
    }
}

private extension SuccessView {
    func commonInit() {
        loadNibContent()
    }
}

extension SuccessView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
