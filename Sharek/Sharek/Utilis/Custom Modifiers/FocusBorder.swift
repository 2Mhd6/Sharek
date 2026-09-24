//
//  FocusBorder.swift
//  Sharek
//
//  Created by Mohammed on 24/09/2026.
//

import SwiftUI

struct FocusBorder: ViewModifier {
    let isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isFocused ? AppColors.primary : AppColors.fieldBorder,
                        lineWidth: isFocused ? 2 : 1
                    )
            }
    }
}


extension View {
    func focusBorder(isFocused: Bool) -> some View {
        modifier(FocusBorder(isFocused: isFocused))
    }
}
