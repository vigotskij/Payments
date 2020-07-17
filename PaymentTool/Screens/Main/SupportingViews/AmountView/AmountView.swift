//
//  AmountView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class AmountView: UIView, NibLoadable {
    private var viewModel: MainModels.AmountViewModel? {
        didSet {
            title?.text = viewModel?.amount
        }
    }

    // MARK: Outlets
    @IBOutlet private weak var title: UILabel?

    func update(viewModel: MainModels.AmountViewModel?) {
        self.viewModel = viewModel
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

private extension AmountView {
    func commonInit() {
        loadNibContent()
    }
}

extension AmountView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
