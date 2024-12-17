//
//  SearchCityGatewayProtocol.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: - Search Location Gateway Protocol
public protocol SearchCityGatewayProtocol {
    func fetch(with parameters: SearchCityParameters) async throws -> [SearchCityEntity]
}
