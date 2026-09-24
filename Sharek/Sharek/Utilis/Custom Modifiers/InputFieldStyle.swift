//
//  InputFieldStyle.swift
//  Sharek
//
//  Created by Mohammed on 24/09/2026.
//

import SwiftUI

struct InputFieldStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(height: 60)
    }
}

extension View {
    func inputFieldStyle() -> some View {
        modifier(InputFieldStyle())
    }
}
