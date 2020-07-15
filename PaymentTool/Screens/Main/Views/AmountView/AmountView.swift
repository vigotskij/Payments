//
//  AmountView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class AmountView: UIView {
    private var viewModel: MainModels.AmountViewModel? {
        didSet {
            title?.text = viewModel?.title
        }
    }

    // MARK: Outlets
    @IBOutlet private weak var title: UILabel?

    func update(viewModel: MainModels.AmountViewModel?) {
        self.viewModel = viewModel
    }
}
