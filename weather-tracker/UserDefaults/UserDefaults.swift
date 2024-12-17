//
//  UserDefaults.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import Foundation

// MARK: User Defaults
extension UserDefaults {
    // MARK: Keys
    enum Keys {
        static let savedCity = "saved_city"
    }
    
    // MARK: Properties
    static var savedCity: String? {
        get {
            if UserDefaults.accessGroup.object(forKey: Keys.savedCity) == nil {
                return nil
            }
            return UserDefaults.accessGroup.string(forKey: Keys.savedCity)
        } set {
            UserDefaults.accessGroup.set(newValue, forKey: Keys.savedCity)
            UserDefaults.accessGroup.synchronize()
        }
    }
}

// MARK: UserDefaults + Access Group
extension UserDefaults {
    static var accessGroup: UserDefaults { UserDefaults.WeatherTrackerApp }
    
    static var WeatherTrackerApp: UserDefaults {
        if let group = UserDefaults(suiteName: "weather_tracker_app") {
            return group
        }
        return .standard
    }
}
