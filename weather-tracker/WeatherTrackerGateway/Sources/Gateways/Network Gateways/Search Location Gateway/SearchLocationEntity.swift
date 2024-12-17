//
//  File.swift
//  WeatherTrackerGateway
//
//  Created by Rezo Joglidze on 15.12.24.
//

import Foundation
import RJSwiftMacros

@CodingKeys()
@MockBuilder(numberOfItems: 10)
public struct SearchLocationEntity: Decodable, Identifiable {
    @CodingKeyIgnored() public let id: UUID = .init()
    public let name: String
    public let region: String
    public let country: String
}
