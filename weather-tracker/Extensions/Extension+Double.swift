//
//  Extension+Double.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: - Extension Double
extension Double {
    // MARK: to String
    func toString(
        rounding: Int = .zero
    ) -> String {
        String(format: "%.\(rounding)f", self)
    }
}
