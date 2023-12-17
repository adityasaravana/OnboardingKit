//
//  File.swift
//
//
//  Created by Aditya Saravana on 12/17/23.
//

import Foundation
import SwiftUI

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    var appVersion: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    var appBuild: String? {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    
    var appIcon: Image? {
        guard let icons = object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any], let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any], let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String], let iconFileName = iconFiles.last else {
            fatalError("Could not find icons in bundle")
        }
        
        return Image(iconFileName)
    }
}
