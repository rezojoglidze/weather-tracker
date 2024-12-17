//
//  MockCurrentWeatherGateway.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: - Mock Get Developers Gateway
public struct MockCurrentWeatherGateway: CurrentWeatherGatewayProtocol {
    public init() { }
    
    public func fetch(with parameters: CurrentWeatherParameters) async throws -> CurrentWeatherEntity {
        CurrentWeatherEntity.mock
    }
}
