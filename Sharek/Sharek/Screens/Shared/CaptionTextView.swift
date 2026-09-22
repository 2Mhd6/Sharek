//
//  CaptionTextView.swift
//  Sharek
//
//  Created by Mohammed on 12/09/2026.
//

import SwiftUI

struct CaptionTextView: View {
    let captionText: String
    
    var body: some View {
        Text(captionText)
            .font(.caption)
            .foregroundStyle(AppColors.secondaryText)
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
}

#Preview {
    CaptionTextView(captionText: "CaptionTextView")
}
