//
//  SNToastAlert.swift
//  CoinMarketApp
//
//  Created by Carlos Jaramillo on 2/18/24.
//

import Foundation


struct SNToastAlert: Equatable {
    static func == (lhs: SNToastAlert, rhs: SNToastAlert) -> Bool {
        return false
    }
    
    enum Duration {
        case short
        case average
        case long
        case custom(Double)

        var length: Double {
            switch self {
            case .short:   return 2.0
            case .average: return 4.0
            case .long:    return 8.0
            case .custom(let Double):
                return Double
            }
        }
    }
    
    enum Location {
        case top
        case bottom
    }
    
    var style: SNToastAlertStyle
    var title: String
    var message: String
    var duration: Duration = .average
    var location: Location = .bottom
    var enableVibration: Bool = false
}
