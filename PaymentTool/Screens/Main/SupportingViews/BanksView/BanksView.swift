//
//  BanksView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class BanksView: UIView, NibLoadable {
    private var viewModel: Banks.ViewModel?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func update(viewModel: Banks.ViewModel?) {
        self.viewModel = viewModel
    }
}

private extension BanksView {
    func commonInit() {
        loadNibContent()
    }
}
extension BanksView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}
