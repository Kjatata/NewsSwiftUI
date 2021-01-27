//
//  OnboardingView.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showOnBoarding = false
    @AppStorage("OnboardBeenViewed") var hasOnBoarded = false
    var body: some View {
        ZStack {
            ZStack {
                AppView()
            }
            .edgesIgnoringSafeArea(.bottom)
            .disabled(showOnBoarding)
            .blur(radius: showOnBoarding ? 3.0 : 0)
            if showOnBoarding {
                OnBoardingImagesView(isPresenting: $showOnBoarding)
            }
        }.onAppear() {
            if !hasOnBoarded {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation{
                        showOnBoarding.toggle()
                        hasOnBoarded = true
                    }
                }
            }
        }
    }
}
