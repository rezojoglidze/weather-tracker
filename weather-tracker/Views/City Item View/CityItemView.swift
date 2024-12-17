//
//  WeatherInfoView.swift
//  WeatherTracker
//
//  Created by Rezo Joglidze on 15.12.24.
//

import SwiftUI
import WeatherTrackerGateway

// MARK: - City Item View
struct CityItemView: View {
    
    // MARK: Properties - UI Model
    private let uiModel: CityItemViewUIModel
    
    // MARK: Properties - Data
    private let parameters: CityItemViewParameters
    
    // MARK: initializers
    init(
        uiModel: CityItemViewUIModel = .init(),
        parameters: CityItemViewParameters
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
        HStack(spacing: .zero) {
            cityInfoView
            Spacer()
            imageView
        }
        .padding(.horizontal, 31)
        .background { backgroundView }
    }
    
    private var cityInfoView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Spacer().frame(height: 16)
            Text(parameters.city.location.name)
                .lineLimit(1)
                .font(uiModel.cityTextFont)
                .foregroundStyle(uiModel.cityTextColor)
            celsiusTextView
            Spacer().frame(height: 6)
        }
    }
    
    private var celsiusTextView: some View {
        HStack(alignment: .top, spacing: .zero) {
            Text("\(parameters.city.location.name)")
                .font(uiModel.celsiusTextFont)
                .foregroundStyle(uiModel.celsiusTextColor)
            
            Spacer().frame(width: 8)
            
            VStack(spacing: .zero) {
                Spacer().frame(height: 16)
                
                Color.white
                    .frame(width: 5, height: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2.5)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }
    
    private var imageView: some View {
        Image(.locationIcon)
            .resizable()
            .frame(width: 83, height: 67)
        
    }
    
    private var backgroundView: some View {
        uiModel.contentViewBackgroundColor
            .clipShape(.rect(cornerRadius: uiModel.contentViewCornerRadius ))
    }
}


// MARK: Preview
#if DEBUG
struct CityItemView_Previews: PreviewProvider {
    static var previews: some View {
        CityItemView(parameters: CityItemViewParameters.mock)
            .padding(16)
    }
}
#endif
