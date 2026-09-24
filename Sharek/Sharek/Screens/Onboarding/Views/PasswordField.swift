//
//  PasswordField.swift
//  Sharek
//
//  Created by Mohammed on 13/09/2026.
//

import SwiftUI

// TODO: MED - Need to refactor

struct PasswordField: View {
    let label: String
    let placeholderText: String
    var showPasswordToggle: Bool
    let field: FocusField
    
    @Binding var isSecure: Bool
    @Binding var password: String
    @FocusState.Binding var focusedField: FocusField?
    var isFocused: Bool { focusedField == field }
    
    var onTap: () -> Void
    var onSubmit: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            labelAndToggleButton
            
            ZStack {
                
                
                SecureField("", text: $password, prompt: Text.placeholder(text: placeholderText))
                    .focused($focusedField, equals: field)
                    .inputFieldStyle()
                    .textContentType(.password)
                    .focusBorder(isFocused: isFocused)
                    .animation(.easeInOut, value: isFocused)
                    .opacity(isSecure ? 1 : 0)
                    .onTapGesture { onTap() }
                    .onSubmit { onSubmit() }
                
                
                TextField("", text: $password, prompt: Text.placeholder(text: placeholderText))
                    .focused($focusedField, equals: field)
                    .inputFieldStyle()
                    .textContentType(.password)
                    .focusBorder(isFocused: isFocused)
                    .animation(.easeInOut, value: isFocused)
                    .opacity(isSecure ? 0 : 1)
                    .onTapGesture { onTap() }
                    .onSubmit { onSubmit() }
            }
        }
        
        
    }
    
    
    var labelAndToggleButton: some View {
        HStack {
            Text(label)
                .foregroundStyle(AppColors.secondaryText)
            
            Spacer()
            
            if showPasswordToggle {
                toggleButton
            }
        }
    }
    
    var toggleButton: some View {
        Button {
            isSecure.toggle()
        } label: {
            Text(isSecure ? "Show" : "Hide")
                .bold()
                .foregroundStyle(AppColors.primaryColor)
        }
        
    }
}

