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
    
    func makeArticleListViewController(with navigator: ArticlesNavigator) -> ArticleListViewController {
        let viewModel = ArticleListViewModel(articleUseCase: articleUseCase, navigator: navigator)
        let listViewController = ArticleListViewController(with: viewModel)
        return listViewController
    }
}
