//
//  MainNavigationBarDelegate.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

protocol MainNavigationBarDelegate: class {
    func shouldHideBackButton() -> Bool
    func backButtonPressed()
}
