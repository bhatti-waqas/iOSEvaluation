//
//  ArticleListChildCoordinator.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//
import Coordinator

final class ArticleDetailsCoordinator: BaseCoordinator<AppNavigationController> {
    
    let detailRow: ArticleRowViewModel
    
    init(detailRow: ArticleRowViewModel, rootViewController: AppNavigationController) {
        self.detailRow = detailRow
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let detailsViewController = ArticleDetailsViewControllerFactory.makeArticleDetailsViewController(wit: detailRow)
        rootViewController.pushViewController(detailsViewController, animated: true)
    }
}
