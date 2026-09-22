//
//  OnboardingButton.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

struct OnboardingButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .foregroundStyle(.white)
                .background(AppColors.primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal)
        }
    }
}

#Preview {
    OnboardingButton(buttonText: "Get Started") {
        print("DEBUG: Test")
    }
}
