//
//  CurrentWeatherGateway.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: - Current Weather Gateway
public struct CurrentWeatherGateway: CurrentWeatherGatewayProtocol {
    public init() { }
    
    public func fetch(with parameters: CurrentWeatherParameters) async throws -> CurrentWeatherEntity {
        let urlString: String = "\(BackendEnvironment.baseAPIURLV1)/current.json?key=\(Constants.APIKey)&q=\(parameters.city)"
        guard let url: URL = .init(string: urlString) else { throw URLError(.badURL) }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "POST"
        
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(for: request)
        
        let entity: CurrentWeatherEntity = try JSONDecoder().decode(CurrentWeatherEntity.self, from: data)
        
        return entity
    }
}
