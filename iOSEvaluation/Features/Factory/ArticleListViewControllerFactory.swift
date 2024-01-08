//
//  ArticleListViewControllerFactory.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//
import UIKit

final class ArticleListViewControllerFactory {
    
    // MARK: - Private Properties
    private let articleUseCase: ArticleUseCase
    
    // MARK: - Init
    init(articleUseCase: ArticleUseCase) {
        self.articleUseCase = articleUseCase
    }
    
    func makeArticleListViewController(with navigator: ArticlesNavigator) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        return controller
    }
}
