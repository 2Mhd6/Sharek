//
//  OnboardingProgressBar.swift
//  Sharek
//
//  Created by Mohammed on 23/09/2026.
//

import SwiftUI

struct OnboardingProgressBar: View {
    let viewModel: OnboardingViewModel

    var body: some View {
        if viewModel.step.showsProgress {
            HStack(spacing: 8) {
                ForEach(OnboardingViewModel.OnboardingStep.allCases.dropFirst(), id: \.self) { item in
                    Capsule()
                        .fill(viewModel.step.rawValue >= item.rawValue ? AppColors.primary : AppColors.trackBackground)
                        .frame(height: 4)
                }
            }
            .animation(.easeInOut, value: viewModel.step)
            .padding(.horizontal)
        }
    }
}

#Preview {
    OnboardingProgressBar(viewModel: OnboardingViewModel())
}
