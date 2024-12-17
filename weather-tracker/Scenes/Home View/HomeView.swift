//
//  HomeView.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import SwiftUI
import WeatherTrackerGateway
import Combine

// MARK: - Home View
struct HomeView: View {
    // MARK: Properties
    private var viewModel: HomeViewModel
    
    @State private var searchText: String = ""
    private let searchTextPublisher = PassthroughSubject<String, Never>()
    
    // MARK: Initializers
    init() {
        self.viewModel = HomeViewModel()
    }
    
    // MARK: Body
    var body: some View {
        ZStack(alignment: .top) {
            backgroundView
            
            VStack(spacing: .zero) {
                Spacer().frame(height: 22)
                searchBar
                
                switch viewModel.contentType {
                case .searchedList: searchResultView
                case .savedCityWeather:
                    if let weather = viewModel.currentWeather {
                        weatherInfoView(weather: weather)
                    }
                case .noCitySelected: noCitySelectedView
                case .empty: EmptyView()
                }
            }
            .padding(.horizontal, 24)
        }
        .progressView(isShowing: viewModel.isLoading)
        .alert(parameters: viewModel.alertParameters)
        .onFirstAppear(perform: {
            viewModel.didLoad()
        })
    }
    
    private var backgroundView: some View {
        Color.white
            .ignoresSafeArea()
    }
    
    // MARK: Search Bar
    private var searchBar: some View {
        ZStack {
            Color.init(hex: 0xF2F2F2)
            
            HStack {
                Spacer().frame(width: 20)
                
                TextField(
                    "Search Location",
                    text: $searchText
                )
                .onChange(of: searchText) { newValue in
                    searchTextPublisher.send(newValue)
                }
                .onReceive(
                    searchTextPublisher
                        .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
                ) { debouncedSearchText in
                    viewModel.searchLocation(searchedText: debouncedSearchText)
                }
                .foregroundStyle(Color.init(hex: 0x2C2C2C))
                
                Spacer().frame(width: 16)
                
                Image(.searchIcon)
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Spacer().frame(width: 14)
            }
        }
        .frame(height: 46)
        .cornerRadius(16)
    }
    
    // MARK: No City Selected
    private var noCitySelectedView: some View {
        GeometryReader { geometry in
            VStack(spacing: .zero) {
                Text("No City Selected")
                    .font(FontBook.bold(size: 30))
                    .foregroundColor(Color(hex: 0x2C2C2C))
                
                Spacer().frame(height: 16)
                
                Text("Please Search For A City")
                    .font(FontBook.bold(size: 15))
                    .foregroundColor(Color(hex: 0x2C2C2C))
                
                Spacer().frame(height: geometry.size.height/2)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
        }
    }
    
    private func weatherInfoView(weather: CurrentWeatherEntity) -> some View {
        VStack(spacing: .zero) {
            Spacer().frame(height: 12)
            WeatherInfoView(parameters: .init(weather: weather))
        }
    }
    
    // MARK: Search Result View
    private var searchResultView: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                Spacer().frame(height: 4)
                
                ForEach(viewModel.searchedCities, id: \.id) { city in
                    CityItemView(parameters: .init(city: city))
                        .onTapGesture {
                            searchText = ""
                            viewModel.didSelectCity(city)
                        }
                }
            }
        }
        .scrollIndicators(.never)
    }
    
}

// MARK: - Preview
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        configurePreview()
        
        return HomeView()
    }
}
#endif
