//
//  PasswordField.swift
//  Sharek
//
//  Created by Mohammed on 13/09/2026.
//

import SwiftUI

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

struct FocusBorder: ViewModifier {
    let isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isFocused ? AppColors.primaryColor : .gray.opacity(0.3),
                        lineWidth: isFocused ? 2 : 1
                    )
            }
    }
}

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
    
    func focusBorder(isFocused: Bool) -> some View {
        modifier(FocusBorder(isFocused: isFocused))
    }
    
}
