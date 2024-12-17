//
//  WeatherInfoViewParameters.swift
//  WeatherTracker
//
//  Created by Rezo Joglidze on 15.17.24.
//

import Foundation
import RJSwiftMacros
import WeatherTrackerGateway

// MARK: Weather Info View Parameters
@MockBuilder()
struct WeatherInfoViewParameters {
    let weather: CurrentWeatherEntity
}
