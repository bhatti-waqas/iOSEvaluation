//
//  UserDefaults.swift
//
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation

public protocol UserDefaultsKey {
    var rawValue: String { get }
}

public extension UserDefaultsKey {
    func save(_ data: Data) {
        UserDefaults.standard.set(data, forKey: rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func get() -> Data? {
        UserDefaults.standard.object(forKey: rawValue) as? Data
    }
}

public extension UserDefaults {
    enum Application: String, UserDefaultsKey {
        case characters
    }
}
