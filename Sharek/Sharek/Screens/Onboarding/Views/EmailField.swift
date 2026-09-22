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
    @Binding var showsInvalidEmailWarning: Bool
    @FocusState.Binding var focusedField: FocusField?
    var isFocused: Bool { focusedField == field }
    
    var onTap: () -> Void
    var onSubmit: () -> Void
    var onChange: () -> Void
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundStyle(AppColors.secondaryText)
            
            inputField
                .onTapGesture {
                    focusedField = .email
                }
            
            if showsInvalidEmailWarning {
                WarningLabel(text: "Enter a valid email address.")
            }
        }
    }
    
    var inputField: some View {
        TextField("", text: $email, prompt: Text.placeholder(text: "you@example.com"))
            .focused($focusedField, equals: .email)
            .inputFieldStyle()
            .textContentType(.emailAddress)
            .onTapGesture(perform: onTap)
            .onSubmit { onSubmit() }
            .onChange(of: email) { _, newValue in
                // TODO: Later when we have VM
                onChange()
            }
            .focusBorder(isFocused: isFocused)
            .animation(.easeInOut, value: isFocused)
    }
}

#Preview {
    @Previewable @FocusState var focusedField: FocusField?
    
    EmailField(label: "Email",
               field: .email,
               email: .constant("you@you.com"),
               showsInvalidEmailWarning: .constant(true),
               focusedField: $focusedField,
               onTap: {},
               onSubmit: {},
               onChange: {})
}
