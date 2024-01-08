//
//  UIViewController.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

typealias SimpleAlertCall = ((UIAlertAction) -> Void)?

extension UIViewController {
    
    func presentAlert(_ message: String, okAction: SimpleAlertCall = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringKey.Generic.ok.get(), style: .default, handler: okAction))
        present(alert, animated: false, completion: {})
    }
}
