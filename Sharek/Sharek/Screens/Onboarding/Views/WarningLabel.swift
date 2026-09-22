//
//  WariningLabel.swift
//  Sharek
//
//  Created by Mohammed on 22/09/2026.
//

import SwiftUI

struct WarningLabel: View {
    
    let text: String
    
    var body: some View {
        Label {
            Text(text)
        } icon: {
            Image(systemName: "exclamationmark.circle")
        }
        .font(.callout)
        .foregroundStyle(.red.opacity(0.6))
    }
}

#Preview {
    WarningLabel(text: "Enter a valid email address.")
}
