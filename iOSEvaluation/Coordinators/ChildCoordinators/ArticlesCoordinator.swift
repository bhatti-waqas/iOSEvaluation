//
//  ArticlesCoordinator.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

import Coordinator

protocol DetailCoordinator {
    func navigateToDetails(with viewModel: ArticleRowViewModel)
}

final class ArticlesCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = ServiceLocator.articleListViewControllersFactory()
        let listViewController = factory.makeArticleListViewController(with: self)
        rootViewController.pushViewController(listViewController, animated: true)
    }
}

extension ArticlesCoordinator: DetailCoordinator {
    
    func navigateToDetails(with viewModel: ArticleRowViewModel) {
        let detailCoordinator = ArticleDetailsCoordinator(detailRow: viewModel, rootViewController: rootViewController)
        startChild(detailCoordinator)
    }
}
