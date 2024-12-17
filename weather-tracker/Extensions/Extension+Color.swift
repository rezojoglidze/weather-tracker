//
//  Extension+Color.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import SwiftUI

// MARK: - Extension Color
extension Color {
    // MARK: Hex Color
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
