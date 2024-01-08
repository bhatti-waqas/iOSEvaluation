//
//  AppNavigationController.swift
//  Modules
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

/// The `BaseCoordinator`  provides basic/abstract implementation of navigations.
/// it is responsible to manage the presentation logic of view controllers.
/// subclass can override `start` implementation for their specific presentation logic.
open class BaseCoordinator<T: UIViewController>: NSObject, Coordinator {
    public let rootViewController: T
    public var child: Coordinator?
    public weak var parent: Coordinator?
    
    // MARK: - init
    public init(rootViewController: T) {
        self.rootViewController = rootViewController
    }
    
    // MARK: - Public Methods
    /// show first view controller
    open func start() {
        assertionFailure("child class must override it.")
    }
}
