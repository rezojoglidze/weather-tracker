//
//  File.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation

// MARK: - Search Location Gateway
public struct SearchLocationGateway: SearchLocationGatewayProtocol {
    public init() { }
    
    public func fetch(with parameters: SearchLocationParameters) async throws -> [SearchLocationEntity] {
        let urlString: String = "\(BackendEnvironment.baseAPIURLV1)/search.json?key=\(Constants.APIKey)&q=\(parameters.searchedText)"
        guard let url: URL = .init(string: urlString) else { throw URLError(.badURL) }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "POST"
        
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(for: request)
        
        let entity: [SearchLocationEntity] = try JSONDecoder().decode([SearchLocationEntity].self, from: data)
        
        return entity
    }
}
