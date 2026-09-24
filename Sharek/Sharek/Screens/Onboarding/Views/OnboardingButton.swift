//
//  OnboardingButton.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

struct OnboardingButton: View {
    let buttonText: String
    var isDisabled: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .foregroundStyle(AppColors.cardBackground)
                .background(isDisabled ? AppColors.primaryLight : AppColors.primary)
                .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .disabled(isDisabled)
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.2), value: isDisabled)
    }
}

#Preview {
    OnboardingButton(buttonText: "Get Started") {
        print("DEBUG: Test")
    }
}
