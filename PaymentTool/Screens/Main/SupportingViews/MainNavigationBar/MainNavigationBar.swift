//
//  MainNavigationBar.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

@IBDesignable
final class MainNavigationBar: UIView, NibLoadable {
    // MARK: Outlets
    @IBOutlet private weak var backButton: UIButton?
    @IBOutlet private weak var titleLable: UILabel? {
        didSet {
            toggleBackButtonPresented()
        }
    }

    // MARK: Delegate
    weak var delegate: MainNavigationBarDelegate?

    // MARK: Actions
    @IBAction func backButtonPressed(_ sender: UIButton?) {
        delegate?.backButtonPressed()
    }

    func setTitle(with title: String) {
        titleLable?.text = title
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

private extension MainNavigationBar {
    func commonInit() {
        loadNibContent()
    }

    func toggleBackButtonPresented() {
        backButton?.isHidden = delegate?.shouldHideBackButton() ?? true
    }
}
