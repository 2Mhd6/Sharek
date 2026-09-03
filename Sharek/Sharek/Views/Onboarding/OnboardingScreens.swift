//
//  OnboardingScreens.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

struct OnboardingScreens: View {
    
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {

                onboardingProgress(currentIndex: currentIndex)
                
                TabView(selection: $currentIndex) {
                    ForEach(0..<5) { index in
                        // TODO: Set up other onboarding screens
                        WelcomeScreen() {
                            currentIndex += 1
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(maxWidth: .infinity)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AppColors.appBackgroundColor.ignoresSafeArea())
        }
    }
    
    func onboardingProgress(currentIndex: Int) -> some View {
        
        HStack(spacing: 8) {
            ForEach(0..<4) { index in
                
                Capsule()
                    .fill(currentIndex >= index ? AppColors.brandGreen : AppColors.progressTrack)
                    .frame(height: 4)
            }
        }
        .animation(.easeInOut, value: currentIndex)
        .padding(.horizontal)
    }
}

#Preview {
    OnboardingScreens()
}
