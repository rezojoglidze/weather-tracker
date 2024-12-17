//
//  File.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation

public struct SearchLocationParameters {
    public let searchedText: String

    public init (searchedText: String) {
        self.searchedText = searchedText
    }
}
