//
//  MockSearchCityGateway.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: - Mock Search Location Gateway
public struct MockSearchCityGateway: SearchCityGatewayProtocol {
    public init() { }
    
    public func fetch(with parameters: SearchCityParameters) async throws -> [SearchCityEntity] {
        SearchCityEntity.mockArray
    }
}

