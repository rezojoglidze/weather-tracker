//
//  CurrentWeatherParameters.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: Current Weather Parameters
public struct CurrentWeatherParameters {
    // MARK: Properties
    public let city: String

    // MARK: Initializers
    public init(city: String) {
        self.city = city
    }
}
