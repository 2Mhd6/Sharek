//
//  AppColors.swift
//  Sharek
//
//  Created by Mohammed on 02/09/2026.
//

import SwiftUI

// TODO: Handle dark mode
struct AppColors {
    // MARK: - Brand
    
    static let appBackgroundColor = Color(hex: "F5F4F1")
    static let primaryColor = Color(hex: "10906A")
    static let primaryShadowColor = Color(hex: "10906A")
    
    
    // MARK: - Text
    
    /// Titles, task names, row labels
    static let primaryText = Color(hex: "17211D")
    
    /// Body copy inside note cards
    static let bodyText = Color(hex: "48504A")
    
    /// Subtitles, descriptions
    static let secondaryText = Color(hex: "79807A")
    
    /// Date chips, neutral pill text
    static let tertiaryText = Color(hex: "8A9089")
    
    /// Section labels, placeholders
    static let mutedText = Color(hex: "A8ADA6")
    
    /// Faint timestamps
    static let timestampText = Color(hex: "C0C4BD")
    
    // MARK: - UI Elements
    
    /// Cards, sheets, inputs, tab bar
    static let white = Color(.white)

    /// progress color
    static let brandGreen = Color(hex: "2E7D5B")
    /// progress color
    static let progressTrack = Color(hex: "E6E4DF")
}


