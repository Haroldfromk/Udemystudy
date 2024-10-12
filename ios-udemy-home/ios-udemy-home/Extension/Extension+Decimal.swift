//
//  Extension+Decimal.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import Foundation

extension Decimal {
    var priceFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: self as NSDecimalNumber) ?? String(describing: self)
    }
}
