//
//  CurrentWeatherEntityGatewayProtocol.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation

// MARK: - Current Weather Gateway Protocol
public protocol CurrentWeatherGatewayProtocol {
    func fetch(with parameters: CurrentWeatherParameters) async throws -> CurrentWeatherEntity
}
