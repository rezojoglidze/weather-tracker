//
//  Extension+View.swift
//  weather-tracker
//
//  Created by Rezo Joglidze on 17.12.24.
//

import SwiftUI

// MARK: - Extension View
extension View {
    public func onFirstAppear(
        perform action: (() -> Void)? = nil
    ) -> some View {
        self
            .modifier(OnFirstAppearModifier(action: action))
    }
}

// MARK: - On First Appear Modifier
private struct OnFirstAppearModifier: ViewModifier {
    // MARK: Properties
    private let action: (() -> Void)?
    
    @State private var didAppearForTheFirstTime: Bool = false
    
    // MARK: Initializers
    init(
        action: (() -> Void)?
    ) {
        self.action = action
    }
    
    // MARK: Body
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                if !didAppearForTheFirstTime {
                    didAppearForTheFirstTime = true
                    action?()
                }
            })
    }
}

// MARK: - Progress View
extension View {
    public func progressView(isShowing: Bool) -> some View {
        self
            .blocksHitTesting(isShowing)
            .overlay(content: {
                if isShowing {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            })
    }
    
    public func blocksHitTesting(
        _ flag: Bool = true
    ) -> some View {
        self
            .overlay(content: {
                if flag {
                    Color.clear.contentShape(.rect)
                }
            })
    }
}

//MARK: - Alert
struct AlertParameters {
    var title: String? = ""
    var message: String?
}

extension View {
    func alert(
        parameters: Binding<AlertParameters?>
    ) -> some View {
        self.alert(
            parameters.wrappedValue?.title ?? "",
            isPresented: Binding(
                get: { parameters.wrappedValue != nil },
                set: { if !$0 { parameters.wrappedValue = nil } }
            ),
            actions: { },
            message: {
                if let message: String = parameters.wrappedValue?.message {
                    Text(message)
                }
            }
        )
    }
}
