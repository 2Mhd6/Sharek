//
//  BackButton.swift
//  Sharek
//
//  Created by Mohammed on 12/09/2026.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label {
                Text("Back")
            } icon: {
                Image(systemName: "chevron.compact.left")
            }
            .bold()
        }
        .tint(AppColors.primary)
    }
}

#Preview {
    BackButton {}
}
