//
//  AnyTransition+Extension.swift
//  Sharek
//
//  Created by Mohammed on 23/09/2026.
//

import SwiftUI

extension AnyTransition {
    
    // TODO: MED - Make it accept any type 
    static func slide(direction: OnboardingViewModel.Direction) -> AnyTransition {
        .asymmetric(
            insertion: .move(edge: direction == .forward ? .trailing : .leading),
            removal: .move(edge: direction == .forward ? .leading : .trailing)
        )
    }
}
