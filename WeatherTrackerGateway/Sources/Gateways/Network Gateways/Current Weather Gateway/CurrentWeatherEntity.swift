//
//  CurrentWeatherEntity.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation
import RJSwiftMacros

@CodingKeys()
@MockBuilder()
public struct CurrentWeatherEntity: Decodable, Identifiable {
    @CodingKeyIgnored() public let id: UUID = .init()
    public let location: Location
    public let current: Current
    
    @CodingKeys()
    @MockBuilder()
    public struct Location: Decodable {
        @MockBuilderProperty(value: "Tbilisi") public let name: String
    }
    
    @CodingKeys()
    @MockBuilder()
    public struct Current: Codable {
        public let uv: Double
        public let humidity: Double
        @CodingKeyProperty("temp_c") public let tempCelsius: Double
        @CodingKeyProperty("feelslike_c") public let feelslikeCelsius: Double
        public let condition: Condition
        
        @CodingKeys()
        @MockBuilder()
        public struct Condition: Codable {
            public let icon: String
            
            public var iconURL: URL? {
                URL(string: "https:\(icon)")
            }
        }
    }
}
