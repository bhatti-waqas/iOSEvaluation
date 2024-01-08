//
//  UITableView.swift
//  Modules
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

public extension UITableView {
    
    func dequeue<T>(for indexPath: IndexPath) -> T where T: UITableViewCell {
        dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
    
    func register<T>(cell: T.Type) where T: UITableViewCell {
        register(T.self, forCellReuseIdentifier: T.cellIdentifier)
    }
}
