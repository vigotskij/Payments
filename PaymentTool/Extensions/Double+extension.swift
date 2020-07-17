//
//  Double+extension.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import Foundation
extension Double {
    func isValidAmount() -> Bool {
        return self > 100 && self < 15000
    }
}
