//
//  OnboardingScreens.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

private enum Direction {
    case forward
    case backward
}

struct OnboardingScreens: View {
    
    @State private var currentIndex = 0
    @State private var direction: Direction = .forward

    
    var body: some View {
        ScrollView {
            ZStack {
                Spacer()
                    .containerRelativeFrame([.horizontal, .vertical])

                VStack(spacing: 0) {
                    onboardingProgress(currentIndex: currentIndex)
                        .opacity(currentIndex == 0 ? 0 : 1)

                    currentScreen(currentIndex: currentIndex)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: direction == .forward ? .trailing : .leading),
                                removal: .move(edge: direction == .forward ? .leading : .trailing)
                            )
                        )
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(AppColors.appBackgroundColor.ignoresSafeArea())
    }
    
    func onboardingProgress(currentIndex: Int) -> some View {
        
        HStack(spacing: 8) {
            ForEach(1..<5) { index in
                
                Capsule()
                    .fill(currentIndex >= index ? AppColors.brandGreen : AppColors.progressTrack)
                    .frame(height: 4)
            }
        }
        .animation(.easeInOut, value: currentIndex)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func currentScreen(currentIndex: Int) -> some View {
        switch currentIndex {
        case 0:
            WelcomeScreen {
                goToNextScreen()
            }
            
        case 1:
            SignUpScreen() {
                goToPreviousScreen()
            }
            
        case 2:
            OTPScreen()
            
        case 3:
            SetUpProfileScreen()
            
        case 4:
            EnableContactsScreen()
            
        default:
            WelcomeScreen {
                goToNextScreen()
            }
        }
    }
    
    
    // TODO: Make it in View model
    private func goToNextScreen() {
        guard currentIndex < 4 else { return }
        direction = .forward
        
        withAnimation(.easeInOut(duration: 0.3)) {
            currentIndex += 1
        }
    }
    
    private func goToPreviousScreen() {
        guard currentIndex > 0 else { return }
        direction = .backward
        
        withAnimation(.easeInOut(duration: 0.3)) {
            currentIndex -= 1
        }
    }
}

#Preview {
    OnboardingScreens()
}
