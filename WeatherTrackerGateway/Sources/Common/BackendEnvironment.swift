//
//  BackendEnvironment.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: - Backend Environment
public enum BackendEnvironment {
    // MARK: Properties
    public static var baseURL: String {
        "https://api.weatherapi.com"
    }
    
    public static var baseAPIURLV1: String {
        "\(baseURL)/v1"
    }
}
