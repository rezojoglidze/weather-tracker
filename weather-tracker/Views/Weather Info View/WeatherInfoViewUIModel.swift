//
//  WeatherInfoViewUIModel.swift
//  WeatherTracker
//
//  Created by Rezo Joglidze on 15.17.24.
//

import SwiftUI

// MARK: - Weather Info View UI Model
struct WeatherInfoViewUIModel {
    let cityTextFont: Font = FontBook.bold(size: 30)
    let cityTextColor: Color = Color.init(hex: 0x2C2C2C)
    
    let locationIconColor: Color = Color.init(hex: 0x2C2C2C)
    
    let celsiusTextFont: Font = FontBook.bold(size: 70)
    let celsiusTextColor: Color = Color.init(hex: 0x2C2C2C)
    
    let detailsInfoTitleFont: Font = FontBook.medium(size: 12)
    let detailsInfoTitleColor: Color = Color.init(hex: 0xC4C4C4)
    
    let detailsInfoSubTitleFont: Font = FontBook.medium(size: 15)
    let detailsInfoSubTitleColor: Color = Color.init(hex: 0x9A9A9A)
    
    let detailsInfoBackgroundColor: Color = Color.init(hex: 0xF2F2F2)
    let detailsInfoCornerRadius: CGFloat = 16
}
