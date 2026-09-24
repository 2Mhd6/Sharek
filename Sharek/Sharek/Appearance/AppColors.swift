//
//  AppColors.swift
//  Sharek
//
//  Created by Mohammed on 02/09/2026.
//

import SwiftUI

// TODO: HIGH - Handle dark mode
enum AppColors {

    // MARK: - Backgrounds & surfaces

    /// The paper ground every screen sits on.
    static let screenBackground = Color(hex: "F5F4F1")

    /// Raised surfaces: cards, sheets, text fields, the tab bar.
    static let cardBackground = Color(hex: "FFFFFF")

    /// The unfilled portion of a track — progress bars, segmented controls, date chips.
    static let trackBackground = Color(hex: "EAE8E2")

    /// Background for a neutral status pill.
    static let pillBackground = Color(hex: "EEEDE8")

    /// Hairline separators between rows, and the tile behind a settings icon.
    static let separator = Color(hex: "F1EFEA")

    /// The resting border around a text field, before it takes focus.
    static let fieldBorder = Color(hex: "ECEAE4")

    // MARK: - Emerald — primary actions, active states, anything complete

    /// Filled buttons, the FAB, the active tab, a met requirement.
    static let primary = Color(hex: "10906A")

    /// Pressed state of a primary button; also text sitting on `primaryLight`.
    static let primaryPressed = Color(hex: "0B6B4F")

    /// Pale green fill for secondary buttons and pills.
    static let primaryLight = Color(hex: "E7F2EC")

    /// Pressed state of a `primaryLight` surface.
    static let primaryLightPressed = Color(hex: "D6EADD")

    /// Border around a selected or outlined element.
    static let primaryBorder = Color(hex: "D4E8DF")

    /// Supporting text placed on top of a full-emerald background.
    static let onPrimarySecondary = Color(hex: "CDEBE0")

    /// Chevrons and other tertiary marks on a full-emerald background.
    static let onPrimaryTertiary = Color(hex: "BFE6D8")

    /// The logo mark — the only gradient in the system.
    static let logoGradient = LinearGradient(
        colors: [Color(hex: "12A07A"), Color(hex: "0C7355")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    /// Glow cast beneath the logo mark. Taken from the gradient's dark end.
    static let logoShadow = Color(hex: "0C7355").opacity(0.25)

    // MARK: - Text & ink
    // A single warm-grey ramp, darkest to lightest. Never pure black.

    /// Titles, task names, row labels.
    static let textPrimary = Color(hex: "17211D")

    /// Body copy inside note cards.
    static let textBody = Color(hex: "48504A")

    /// Subtitles and descriptions beneath a title.
    static let textSecondary = Color(hex: "79807A")

    /// Date chips and text inside neutral pills.
    static let textTertiary = Color(hex: "8A9089")

    /// Section headers and text field placeholders.
    static let textMuted = Color(hex: "A8ADA6")

    /// Faint timestamps — the lightest readable step.
    static let textFaint = Color(hex: "C0C4BD")

    /// Default tint for row icons.
    static let iconDefault = Color(hex: "6E756F")

    /// Disclosure chevrons at the trailing edge of a row.
    static let iconChevron = Color(hex: "C9CDC7")

    /// An unmet checkbox or requirement — the "not yet" state.
    static let iconInactive = Color(hex: "D3D8D2")

    /// The drag handle at the top of a sheet.
    static let sheetGrabber = Color(hex: "CBD2CA")

    // MARK: - Amber — reserved for the claim ("in progress") state

    /// Claim button, its label, and the pulsing dot.
    static let claim = Color(hex: "B07D1E")

    /// Pressed state of a claim button; also take-over text.
    static let claimPressed = Color(hex: "946717")

    /// Pale amber fill for the claim pill and take-over button.
    static let claimLight = Color(hex: "FBF0DD")

    /// Pressed state of a `claimLight` surface.
    static let claimLightPressed = Color(hex: "F5E7C8")

    /// Border and dividers on a claimed card.
    static let claimBorder = Color(hex: "F3E7CE")

    /// Chevrons on a claimed card.
    static let claimChevron = Color(hex: "D9C79A")

    /// Count badges on a claimed card.
    static let claimCount = Color(hex: "C6A45E")

    // MARK: - Terracotta — destructive: remove, leave, delete, sign out

    /// Destructive text and icons.
    static let destructive = Color(hex: "C4553B")

    /// Pale fill behind a destructive action.
    static let destructiveLight = Color(hex: "FBEDE9")

    /// Pressed state of a `destructiveLight` surface.
    static let destructiveLightPressed = Color(hex: "F7E1DB")

    // MARK: - Activity badges
    // The event type shown on an actor's avatar in the activity feed.

    enum Activity {
        /// A task was completed.
        static let completed = Color(hex: "10906A")

        /// A task was added to a list.
        static let taskAdded = Color(hex: "3E7CB1")

        /// A task was claimed by a member.
        static let claimed = Color(hex: "B07D1E")

        /// A member joined the list.
        static let memberJoined = Color(hex: "8C5A7D")

        /// A new list was created.
        static let listCreated = Color(hex: "6E6A8A")
    }
}
