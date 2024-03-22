//
//  SNToastAlertStyle.swift
//  CoinMarketApp
//
//  Created by Carlos Jaramillo on 2/18/24.
//

import Foundation
import SwiftUI

enum SNToastAlertStyle {
    case error
    case warning
    case success
    case info
    case custom (color: Color, IconName: String)
}

extension SNToastAlertStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .info: return Color.blue
        case .success: return Color.green
        case .custom(color: let color, IconName: _):
            return color
        }
    }
    
    var iconName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "exclamationmark.circle.fill"
        case .custom(color: _, IconName: let iconName):
            return iconName
        }
    }
}
