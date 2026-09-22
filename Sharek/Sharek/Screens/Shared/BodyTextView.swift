//
//  BodyTextView.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

struct BodyTextView: View {
    
    let bodyText: String
    
    var body: some View {
        Text(bodyText)
            .font(.body)
            .foregroundStyle(AppColors.secondaryText)
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
}

#Preview {
    BodyTextView(bodyText: "Shared lists that notify everyone the moment a task is done")
}
