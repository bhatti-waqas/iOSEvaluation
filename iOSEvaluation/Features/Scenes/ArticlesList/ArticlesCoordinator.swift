//
//  ArticlesCoordinator.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

import UIKit
import Coordinator
import SwiftUI

final class ArticlesCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = ServiceLocator.articleListViewControllersFactory()
        let listViewController = factory.makeArticleListViewController(with: self)
        rootViewController.pushViewController(listViewController, animated: true)
    }
}

// MARK: - Articles Navigator
extension ArticlesCoordinator: ArticlesNavigator {
    func showDetails() {
    }
}
