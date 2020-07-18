//
//  PaymentMethodsView.swift
//  PaymentTool
//
//  Created by Boris Sortino on 15/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

protocol PaymentMethodsViewDelegate: class {
    func nextButtonPressed(row: Int)
}

final class PaymentMethodsView: UIView, NibLoadable {
    private var viewModel: PaymentMethods.ViewModel? {
        didSet {
            updateUI()
        }
    }

    // MARK: - public properties
    weak var delegate: PaymentMethodsViewDelegate?

    // MARK: - Outlets
    @IBOutlet private weak var pickerView: UIPickerView? {
        didSet {
            pickerView?.dataSource = self
            pickerView?.delegate = self
        }
    }
    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: UIButton?) {
        guard
            let row = pickerView?.selectedRow(inComponent: 0) else {
                return
        }
        delegate?.nextButtonPressed(row: row)
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

    func update(viewModel: PaymentMethods.ViewModel?) {
        self.viewModel = viewModel
    }
}

private extension PaymentMethodsView {
    func commonInit() {
        loadNibContent()
    }
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.pickerView?.reloadAllComponents()
        }
    }
}

extension PaymentMethodsView: Hideable {
    func shouldHide() -> Bool {
        return viewModel == nil
    }
}

extension PaymentMethodsView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.methods.count ?? 0
    }
}

extension PaymentMethodsView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.methods[row].name
    }
}
