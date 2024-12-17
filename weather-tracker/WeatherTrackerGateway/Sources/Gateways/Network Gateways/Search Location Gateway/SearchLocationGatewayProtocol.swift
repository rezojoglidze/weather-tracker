//
//  SearchLocationGatewayProtocol.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation

// MARK: - Search Location Gateway Protocol
public protocol SearchLocationGatewayProtocol {
    func fetch(with parameters: SearchLocationParameters) async throws -> [SearchLocationEntity]
}
