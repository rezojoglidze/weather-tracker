//
//  File.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation

// MARK: - Mock Search Location Gateway
public struct MockSearchLocationGateway: SearchLocationGatewayProtocol {
    public init() { }
    
    public func fetch(with parameters: SearchLocationParameters) async throws -> [SearchLocationEntity] {
        SearchLocationEntity.mockArray
    }
}

