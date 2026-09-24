//
//  Text+Extension.swift
//  Sharek
//
//  Created by Mohammed on 13/09/2026.
//

import SwiftUI

extension Text {
    static func placeholder(text: String) -> Text? {
        var string = AttributedString(text)
        string.foregroundColor = AppColors.textMuted
        return Text(string)
    }
}
