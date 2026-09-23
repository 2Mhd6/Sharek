//
//  OnboardingScreens.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

struct OnboardingScreens: View {
    @State private var onboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        ScrollView {
                VStack(spacing: 0) {
                    OnboardingProgressBar(viewModel: onboardingViewModel)

                    currentScreen
                        .transition(.slide(direction: onboardingViewModel.direction))
                }
                .containerRelativeFrame([.horizontal, .vertical])
        }
        .scrollBounceBehavior(.basedOnSize)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(AppColors.appBackgroundColor.ignoresSafeArea())
    }
    
    @ViewBuilder
    private var currentScreen: some View {
        switch onboardingViewModel.step {
        case .welcome:
            WelcomeScreen { onboardingViewModel.goNext() }
        case .signUp:
            SignUpScreen { onboardingViewModel.goBack() }
        case .otp:
            OTPScreen()
        case .profile:
            SetUpProfileScreen()
        }
    }
}

#Preview {
    OnboardingScreens()
}
