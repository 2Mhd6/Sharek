//
//  SignUpScreen.swift
//  Sharek
//
//  Created by Mohammed on 03/09/2026.
//

import SwiftUI

enum FocusField: Hashable {
    case email
    case password
    case confirmPassword
}

struct SignUpScreen: View {
    
    @State private var email: String = ""
    @State var isValidEmail = false
    @State private var isShowEmailValidatorWarning = false
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSecurePassword = true
    
    @FocusState private var focusedField: FocusField?
    
    var backAction: () -> Void
    
    
    var body: some View {
        
        VStack (alignment: .leading){
            HStack {
                BackButton {
                    backAction()
                }
                Spacer()
            }
            .padding(.bottom, 24)
            
            VStack(alignment: .leading, spacing: 8) {
                TitleTextView(text: "Create your account")
            }
            .padding(.bottom, 32)
            
            EmailField(label: "Email",
                       field: .email,
                       email: $email,
                       showsInvalidEmailWarning: $isShowEmailValidatorWarning,
                       focusedField: $focusedField,
                       onTap: { focusedField = .email },
                       onSubmit: { focusedField = .password },
                       onChange: {})
            .padding(.bottom, 32)
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                PasswordField(label: "Password",
                              placeholderText: "Choose a password",
                              showPasswordToggle: true,
                              field: .password,
                              isSecure: $isSecurePassword,
                              password: $password,
                              focusedField: $focusedField,
                              onTap: { focusedField = .password },
                              onSubmit: { focusedField = .confirmPassword })
                
                PasswordField(label: "Confirm password",
                              placeholderText: "Repeat it",
                              showPasswordToggle: false,
                              field: .confirmPassword,
                              isSecure: $isSecurePassword,
                              password: $confirmPassword,
                              focusedField: $focusedField,
                              onTap: { focusedField = .confirmPassword },
                              onSubmit: { focusedField = nil })
            }
            .padding(.bottom, 24)
            
            VStack (alignment: .leading, spacing: 4){
                RequirementRow(text: "At least 8 characters", isMet: false)
                RequirementRow(text: "Contains a number", isMet: true)
                RequirementRow(text: "Contains upper and lowercase letters", isMet: false)
            }
            
            Spacer()
            
            OnboardingButton(buttonText: "Create Account") {
                print("DEBUG: Sign Up Screen tapped ")
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8)
        .background(AppColors.appBackgroundColor)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onTapGesture {
            focusedField = nil
        }
    }
    
    
    // TODO: Move to VM
    private func emailValidator(email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !email.isEmpty else {
            return false
        }
        
        let parts = email.split(
            separator: "@",
            omittingEmptySubsequences: false
        )
        
        guard parts.count == 2 else {
            return false
        }
        
        let localPart = parts[0]
        let domain = parts[1]
        
        guard !localPart.isEmpty,
              !domain.isEmpty,
              domain.contains("."),
              !domain.hasPrefix("."),
              !domain.hasSuffix("."),
              !email.contains(" ") else {
            return false
        }
        
        return true
    }
}

#Preview {
    SignUpScreen {
        print("DEBUG: Back Button Tapped")
    }
}
