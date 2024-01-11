//
//  AppCoordinator.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

import UIKit
import Coordinator

/// `AppCoordinator` is responsible to manage transition at windows level.
final class AppCoordinator: BaseCoordinator<AppNavigationController> {
    
    // MARK: - Private Properties
    private let window: UIWindow
    
    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
        super.init(rootViewController: .init())
    }
    
    override func start() {
        let coordinator = ArticlesCoordinator(rootViewController: rootViewController)
        startChild(coordinator)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
