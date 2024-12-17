//
//  WeatherInfoView.swift
//  WeatherTracker
//
//  Created by Rezo Joglidze on 15.17.24.
//

import SwiftUI
import WeatherTrackerGateway

// MARK: - Weather Info View
struct WeatherInfoView: View {
    
    // MARK: Properties - UI Model
    private let uiModel: WeatherInfoViewUIModel
    
    // MARK: Properties - Data
    private let parameters: WeatherInfoViewParameters
    
    // MARK: initializers
    init(
        uiModel: WeatherInfoViewUIModel = .init(),
        parameters: WeatherInfoViewParameters
    ) {
        self.uiModel = uiModel
        self.parameters = parameters
    }
    
    // MARK: Body
    var body: some View {
        ZStack {
            contentView
        }
    }
    
    // MARK: Content View
    private var contentView: some View {
        VStack(spacing: 0) {
            weatherIconView
            Spacer().frame(height: 27)
            locationView
            Spacer().frame(height: 18)
            celsiusView
            Spacer().frame(height: 36)
            detailInformationView
        }
        .padding(.horizontal, 16)
    }
    
    private var weatherIconView: some View {
        AsyncImage(
            url: parameters.weather.current.condition.iconURL,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                Color.white
            })
        .frame(width: 123, height: 123)
        .mask(RoundedRectangle(cornerRadius: 16))
    }
    
    private var locationView: some View {
        HStack(spacing: .zero) {
            Text(parameters.weather.location.name)
                .font(uiModel.cityTextFont)
                .foregroundStyle(uiModel.cityTextColor)
            
            Spacer().frame(width: 11)
            
            Image(.locationIcon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 21, height: 21)
                .foregroundStyle(uiModel.locationIconColor)
        }
    }
    
    private var celsiusView: some View {
        HStack(alignment: .top, spacing: .zero) {
            Text(parameters.weather.current.tempCelsius.toString())
                .font(uiModel.celsiusTextFont)
                .foregroundStyle(uiModel.celsiusTextColor)
            
            VStack(spacing: .zero) {
                Spacer().frame(height: 2)
                
                Color.white
                    .frame(width: 8, height: 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black, lineWidth: 1.5)
                    )
            }
        }
    }
    
    // MARK: - Detail Information View
    private var detailInformationView: some View {
        HStack(spacing: .zero) {
            Spacer().frame(width: 28)
            humidityView
            Spacer().frame(width: 56)
            uvView
            Spacer().frame(width: 56)
            feelsLikeView
            Spacer().frame(width: 28)
        }
        .frame(height: 75)
        .background(content: { detailsInfobackgroundView })
    }
    
    private var humidityView: some View {
        VStack(spacing: .zero) {
            Text("humidity")
                .font(uiModel.detailsInfoTitleFont)
                .foregroundStyle(uiModel.detailsInfoTitleColor)
            
            Spacer().frame(height: 4)
            
            Text("\(parameters.weather.current.humidity.toString())%")
                .font(uiModel.detailsInfoSubTitleFont)
                .foregroundStyle(uiModel.detailsInfoSubTitleColor)
        }
    }
    
    private var uvView: some View {
        VStack(spacing: .zero) {
            Text("UV")
                .font(uiModel.detailsInfoTitleFont)
                .foregroundStyle(uiModel.detailsInfoTitleColor)
            
            Spacer().frame(height: 4)
            
            Text(parameters.weather.current.uv.toString())
                .font(uiModel.detailsInfoSubTitleFont)
                .foregroundStyle(uiModel.detailsInfoSubTitleColor)
        }
    }
    
    private var feelsLikeView: some View {
        VStack(spacing: .zero) {
            Text("Feels Like")
                .font(uiModel.detailsInfoTitleFont)
                .foregroundStyle(uiModel.detailsInfoTitleColor)
            
            Spacer().frame(height: 4)
            
            Text("\(parameters.weather.current.feelslikeCelsius.toString())°")
                .font(uiModel.detailsInfoSubTitleFont)
                .foregroundStyle(uiModel.detailsInfoSubTitleColor)
        }
    }
    
    private var detailsInfobackgroundView: some View {
        uiModel.detailsInfoBackgroundColor
            .clipShape(.rect(cornerRadius: uiModel.detailsInfoCornerRadius ))
    }
}


// MARK: Preview
#if DEBUG
struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(parameters: WeatherInfoViewParameters.mock)
            .padding(16)
    }
}
#endif
