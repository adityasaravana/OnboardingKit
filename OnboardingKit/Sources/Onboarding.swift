//
//  Onboarding.swift
//  Afterburner
//
//  Created by Aditya Saravana on 7/24/23.
//

import Foundation
import SwiftUI

enum OnboardingPage: CaseIterable {
     case welcome
     case keyboardShortcuts
     case openAIKey
     
     static let fullOnboarding = OnboardingPage.allCases
    
    var buttonType: ButtonType {
        switch self {
        case .welcome:
            return .Next
        case .keyboardShortcuts:
            return .Skip
        case .openAIKey:
            return .Done
        }
    }
    
    enum ButtonType: String {
        case Next
        case Skip
        case Done
    }
     
     
 } 
