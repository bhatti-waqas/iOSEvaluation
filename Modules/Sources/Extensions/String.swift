//
//  String.swift
//  
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

// MARK: - String+Localizations
public extension String {
    func localize() -> String {
        NSLocalizedString(self, comment: "")
    }
}
