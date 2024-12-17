//
//  WeatherInfoViewUIModel.swift
//  WeatherTracker
//
//  Created by Rezo Joglidze on 15.12.24.
//

import SwiftUI

// MARK: - City Item View UI Model
struct CityItemViewUIModel {
    let cityTextFont: Font = FontBook.bold(size: 20)
    let cityTextColor: Color = Color.init(hex: 0x2C2C2C)
        
    let celsiusTextFont: Font = FontBook.medium(size: 25)
    let celsiusTextColor: Color = Color.init(hex: 0x2C2C2C)
    
    let contentViewBackgroundColor: Color = Color.init(hex: 0xF2F2F2)
    let contentViewCornerRadius: CGFloat = 16
}
