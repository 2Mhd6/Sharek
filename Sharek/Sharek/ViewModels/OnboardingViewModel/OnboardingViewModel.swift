//
//  OnboardingViewModel.swift
//  Sharek
//
//  Created by Mohammed on 23/09/2026.
//

import SwiftUI

@Observable
class OnboardingViewModel {
    
    enum OnboardingStep: Int, CaseIterable {
        case welcome, signUp, otp, profile
        
        var next: Self? { Self(rawValue: rawValue + 1) }
        var previous: Self? { Self(rawValue: rawValue - 1) }
        var showsProgress: Bool { self != .welcome }
    }
    
    enum Direction { case forward, backward }
    
    private(set) var step: OnboardingStep = .welcome
    private(set) var direction: Direction = .forward

    func goNext() {
        guard let next = step.next else { return }
        direction = .forward
        withAnimation(.easeInOut(duration: 0.3)) {
            step = next
        }
    }

    func goBack() {
        guard let previous = step.previous else { return }
        direction = .backward
        withAnimation(.easeInOut(duration: 0.3)) {
            step = previous
        }
    }
    
}
