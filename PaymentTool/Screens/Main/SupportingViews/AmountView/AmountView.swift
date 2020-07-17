//
//  AmountView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class AmountView: UIView, NibLoadable, UITextInputTraits {
    private var viewModel: MainModels.AmountViewModel? {
        didSet {
            title?.text = viewModel?.amount
        }
    }
    private var amount: String = "" {
        didSet {
            title?.text = formattedAmount
        }
    }
    private var amountDouble: Double {
        (Double(amount) ?? 0.0) * 0.01
    }
    private var formattedAmount: String {
        String(format: "$ %.2f", amountDouble)
    }

    // MARK: Public properties
    var keyboardType: UIKeyboardType = .numberPad
    var didFinishedEnterAmount: ((String) -> Void)?

    // MARK: Outlets
    @IBOutlet private weak var title: UILabel?

    // MARK: Actions
    @IBAction func continueButtonTapped(_ sender: UIButton?) {
        if let didFinishedEnterAmount = didFinishedEnterAmount {
            if amountDouble.isValidAmount() {
                resignFirstResponder()
                // MARK: adding delay so it looks like animated
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    didFinishedEnterAmount(self.formattedAmount)
                }
            }
        }
    }

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

extension AmountView {
    override var canBecomeFirstResponder: Bool {
        return true
    }
}

// MARK: - UIKeyInput
extension AmountView: UIKeyInput {
    var hasText: Bool {
        return amount.count > 0
    }

    func insertText(_ text: String) {
        amount.append(contentsOf: text)
    }

    func deleteBackward() {
        if hasText {
            amount.removeLast()
        }
    }
}
