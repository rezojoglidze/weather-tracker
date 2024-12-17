//
//  DIContainer.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation
import WeatherTrackerGateway

// MARK: - DIContainer
final class DIContainer {
    // MARK: Properties - Singleton
    static let shared: DIContainer = .init()

    // MARK: Properties - Gateways
    lazy var networkGateways: NetworkGateways = .init()
    
    // MARK: Initializers
    private init() {}
    
    // MARK: Network Gateways
    final class NetworkGateways {
        // MARK: Properties - Get Developers Gateweay
        lazy var currentWeatherGateway: CurrentWeatherGatewayProtocol = CurrentWeatherGateway()
        lazy var searchCityGateway: SearchCityGatewayProtocol = SearchCityGateway()

    }
    
    // MARK: Preview Injection
#if DEBUG
    func injectPreviewDependencies() {
        networkGateways.currentWeatherGateway = MockCurrentWeatherGateway()
        networkGateways.searchCityGateway = MockSearchCityGateway()
    }
#endif
}
