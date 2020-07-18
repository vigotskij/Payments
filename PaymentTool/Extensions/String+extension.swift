//
//  String+extension.swift
//  PaymentTool
//
//  Created by Boris Sortino on 17/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import Foundation

extension String {
    func isZero() -> Bool {
        guard let number = Int(self) else {
            return false
        }
        return number == 0
    }
}
