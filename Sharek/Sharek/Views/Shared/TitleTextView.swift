//
//  TitleTextView.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

struct TitleTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(AppColors.primaryText)
    }
}

#Preview {
    TitleTextView(text: "Sharek")
}
