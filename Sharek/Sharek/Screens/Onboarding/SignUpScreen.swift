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
    
    @State private var signUpViewModel = SignUpViewModel()
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
            .padding(.top, 24)
            
            TitleTextView(text: "Create your account")
                .padding(.bottom, 32)
            
            VStack(alignment: .leading) {
                EmailField(label: "Email",
                           field: .email,
                           email: $signUpViewModel.email,
                           focusedField: $focusedField)
                
                if signUpViewModel.showsEmailWarning {
                    WarningLabel(text: "Enter a valid email address.")
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .animation(.easeInOut(duration: 0.2), value: signUpViewModel.showsEmailWarning)
            .padding(.bottom, 32)
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                PasswordField(label: "Password",
                              placeholderText: "Choose a password",
                              showPasswordToggle: true,
                              field: .password,
                              isSecure: $isSecurePassword,
                              password: $signUpViewModel.password,
                              focusedField: $focusedField,
                              onTap: { focusedField = .password },
                              onSubmit: { focusedField = .confirmPassword })
                .submitLabel(.next)
                
                PasswordField(label: "Confirm password",
                              placeholderText: "Repeat it",
                              showPasswordToggle: false,
                              field: .confirmPassword,
                              isSecure: $isSecurePassword,
                              password: $signUpViewModel.confirmPassword,
                              focusedField: $focusedField,
                              onTap: { focusedField = .confirmPassword },
                              onSubmit: { focusedField = nil })
                .submitLabel(.done)
            }
            .padding(.bottom, 24)
            
            VStack (alignment: .leading, spacing: 4){
                ForEach(signUpViewModel.passwordRequirements) { requirement in
                    RequirementRow(text: requirement.text, isMet: requirement.isMet)
                }
            }
            
            Spacer()
            
            OnboardingButton(buttonText: "Create Account", isDisabled: !signUpViewModel.canCreateAccount) {
                print("DEBUG: Sign Up Screen tapped ")
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8)
        .background(AppColors.screenBackground)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onTapGesture {
            focusedField = nil
        }
    }
}

#Preview {
    SignUpScreen {
        print("DEBUG: Back Button Tapped")
    }
}
