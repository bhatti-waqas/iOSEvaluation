//
//  IOSColor.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

import UIKit
import DesignSystem

enum IOSColor: Int {
    case grey = 1
    
    var colorCode: String {
        switch self {
        case .grey:
            return "#808080"
        }
    }
    
    func color(opacity: CGFloat) -> UIColor {
        return UIColor.color(self.colorCode, alpha: opacity)!
    }
}
