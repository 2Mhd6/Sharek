//
//  EmailField.swift
//  Sharek
//
//  Created by Mohammed on 13/09/2026.
//

import SwiftUI

struct EmailField: View {
    let label: String
    let field: FocusField

    @Binding var email: String
    @FocusState.Binding var focusedField: FocusField?

    private var isFocused: Bool { focusedField == field }

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundStyle(AppColors.textSecondary)

            TextField("", text: $email, prompt: Text.placeholder(text: "you@example.com"))
                .focused($focusedField, equals: field)
                .inputFieldStyle()
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .submitLabel(.next)
                .focusBorder(isFocused: isFocused)
                .animation(.easeInOut, value: isFocused)
        }
    }
}

#Preview {
    @Previewable @FocusState var focusedField: FocusField?
    @Previewable @State var email = ""
    
    EmailField(label: "Email",
                    field: .email,
                    email: $email,
                    focusedField: $focusedField)
}
