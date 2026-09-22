//
//  RequirementRow.swift
//  Sharek
//
//  Created by Mohammed on 12/09/2026.
//

import SwiftUI

// TODO: MED - edit size of the text
struct RequirementRow: View {
    let text: String
    let isMet: Bool

    var body: some View {
        Label {
            CaptionTextView(captionText: text)
        } icon: {
            Image(systemName: isMet ? "checkmark.circle.fill" : "circle")
                .imageScale(.small)
                .foregroundStyle(isMet ? .green : .gray)
        }
        .animation(.easeInOut(duration: 0.2), value: isMet)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 16) {
        RequirementRow(text: "At least 8 characters", isMet: true)
        RequirementRow(text: "Contains a number", isMet: false)
    }
}
