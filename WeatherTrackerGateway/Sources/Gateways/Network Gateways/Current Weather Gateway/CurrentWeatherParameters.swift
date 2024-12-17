//
//  File.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation

public struct CurrentWeatherParameters {
    public let city: String

    public init(city: String) {
        self.city = city
    }
}
