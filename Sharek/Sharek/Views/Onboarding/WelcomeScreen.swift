//
//  WelcomeScreen.swift
//  Sharek
//
//  Created by Mohammed on 02/09/2026.
//

import SwiftUI

struct WelcomeScreen: View {
    
    let action: () -> Void
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                VStack {
                    
                    Spacer()
                    
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .shadow(color: AppColors.primaryColor.opacity(0.5), radius: 26, y: 12)
                        .padding(.bottom, 32)
                    
                    TitleTextView(text: "Sharek")
                        .padding(.bottom, 8)
                    
                    BodyTextView(bodyText: "Shared lists that notify everyone the moment a task is done")
                        .frame(width: geometry.size.width * 0.7)
                    
                    Spacer()
                    
                    OnboardingButton(buttonText: "Get Started") {
                        action()
                    }
                    .padding(.bottom, 32)
                    
                }
                
                localizableButton {
                    // TODO: Convert to Arabic and otherwise
                    print("DEBUG: Tapped")
                }
            }
            .background(AppColors.appBackgroundColor)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
    }
    
    func localizableButton(action: @escaping () -> Void) -> some View{
        Button {
            action()
        } label: {
            localizableLabel
        }
    }
    
    var localizableLabel: some View {
        Label {
            Text("العربية")
        } icon: {
            Image(systemName: "globe")
        }
        .frame(width: 100, height: 40)
        .foregroundStyle(AppColors.primaryText)
        .background(AppColors.white)
        .clipShape(.capsule)
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
    }
}

#Preview {
    WelcomeScreen {
        print("DEBUG: WelcomeScreen")
    }
}
