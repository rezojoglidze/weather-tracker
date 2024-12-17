//
//  HomeViewModel.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import WeatherTrackerGateway
import SwiftUI

// MARK: - Home View Model
@Observable final class HomeViewModel {
    // MARK: Properties
    private(set) var isLoading: Bool = false
    private var showAlert: AlertParameters?
    
    private(set) var currentWeather: CurrentWeatherEntity?
    private(set) var searchedCities: [CurrentWeatherEntity] = []
}

extension HomeViewModel {
    // MARK: Properties
    var alertParameters: Binding<AlertParameters?> {
        Binding(
            get: { self.showAlert },
            set: { self.showAlert = $0 }
        )
    }
    
    var contentType: HomeViewContentType {
        if !searchedCities.isEmpty {
            return .searchedList
        } else if currentWeather != nil {
            return .savedCityWeather
        } else {
            if isLoading {
                return .empty
            } else {
                return .noCitySelected
            }
        }
    }
    
    // MARK: Lifecycle
    func didLoad() {
        if let cityName = UserDefaults.savedCity {
            getCurrentWeather(with: cityName)
        }
    }
    
    // MARK: Actions
    func didSelectCity(_ city: CurrentWeatherEntity) {
        UserDefaults.savedCity = city.location.name
        searchedCities = []
        
        getCurrentWeather(with: city.location.name)
    }
    
    // MARK: Requests
    private func getCurrentWeather(with cityName: String) {
        Task { @MainActor in
            do {
                isLoading = true
                defer { isLoading = false }
                
                let currentWeather: CurrentWeatherEntity = try await DIContainer.shared.networkGateways.currentWeatherGateway.fetch(with: .init(city: cityName))
                
                guard !Task.isCancelled else { return }
                
                self.currentWeather = currentWeather
                print(currentWeather)
            } catch {
                guard !Task.isCancelled else { return }
                
                showAlert = .init(message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    func searchLocation(searchedText: String) {
        if searchedText.isEmpty {
            searchedCities = []
            return
        }
        
        Task { @MainActor in
            do {
                isLoading = true
                defer { isLoading = false }
                
                let cities: [SearchCityEntity] = try await DIContainer.shared.networkGateways.searchCityGateway.fetch(with: .init(searchedText: searchedText))
                
                guard !Task.isCancelled else { return }
                
                var data: [CurrentWeatherEntity] = []

                for city in cities {
                    do {
                        let weather: CurrentWeatherEntity = try await DIContainer.shared.networkGateways.currentWeatherGateway.fetch(with: .init(city: city.name))
                        data.append(weather)
                    } catch {
                        showAlert = .init(message: error.localizedDescription)
                    }
                }
                
                searchedCities = data
            } catch {
                guard !Task.isCancelled else { return }
                
                showAlert = .init(message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
}
