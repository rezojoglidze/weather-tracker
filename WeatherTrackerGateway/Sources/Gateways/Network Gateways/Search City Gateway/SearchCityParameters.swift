//
//  SearchCityParameters.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: Search Location Parameters
public struct SearchCityParameters {
    // MARK: Properties
    public let searchedText: String

    // MARK: Initializers
    public init (searchedText: String) {
        self.searchedText = searchedText
    }
}
