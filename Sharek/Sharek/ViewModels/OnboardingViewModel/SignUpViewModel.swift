//
//  SignUpViewModel.swift
//  Sharek
//
//  Created by Mohammed on 23/09/2026.
//

import SwiftUI

@Observable
class SignUpViewModel {
    
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    var showsEmailWarning: Bool {
        !email.isEmpty && !emailValidator()
    }
    
    struct PasswordRequirement: Hashable, Identifiable{
        let id: String
        let text: String
        let isMet: Bool
    }
    
    var passwordRequirements: [PasswordRequirement] {
        [
            .init(id: "length",  text: "At least 8 characters",       isMet: hasMinimumLength),
            .init(id: "case",    text: "Upper and lowercase letters", isMet: hasUpperAndLowercase),
            .init(id: "digit",   text: "A number",                    isMet: hasDigit),
            .init(id: "special", text: "A special character",         isMet: hasSpecialCharacter),
            .init(id: "match",   text: "Passwords match",             isMet: passwordsMatch)
        ]
    }
    
    
    // MARK: - Email validation
    func emailValidator() -> Bool {
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
    
    // MARK: - Password Validation
    
    var hasMinimumLength: Bool { password.count >= 8 }

    var hasDigit: Bool { password.contains(/[0-9]/) }
    
    var hasSpecialCharacter: Bool {
        password.contains(/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~`]/)
    }

    var hasUpperAndLowercase: Bool {
        password.contains(/[A-Z]/) && password.contains(/[a-z]/)
    }

    var passwordsMatch: Bool {
        !confirmPassword.isEmpty && password == confirmPassword
    }

    var isPasswordValid: Bool {
        hasMinimumLength && hasDigit && hasSpecialCharacter && hasUpperAndLowercase && passwordsMatch
    }
    
    
    // MARK: - Email & Password Checks
    var canCreateAccount: Bool { emailValidator() && isPasswordValid }
    
    
    // MARK: - AUTH
    func signUp(email: String, password: String) {
        // TODO: HIGH - Add sign up logic
    }
}
