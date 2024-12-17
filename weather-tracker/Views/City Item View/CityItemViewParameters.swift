//
//  CityItemViewParameters.swift
//  WeatherTracker
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation
import RJSwiftMacros
import WeatherTrackerGateway

// MARK: City Item View
@MockBuilder()
struct CityItemViewParameters {
    let city: CurrentWeatherEntity
}
