//
//  ArticleListViewControllerFactory.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

final class ArticleListViewControllerFactory {
    
    // MARK: - Private Properties
    private let articleUseCase: ArticleUseCase
    
    // MARK: - Init
    init(articleUseCase: ArticleUseCase) {
        self.articleUseCase = articleUseCase
    }
    
    func makeArticleListViewController(with coordinator: ArticlesCoordinator) -> ArticleListViewController {
        let viewModel = ArticleListViewModel(articleUseCase: articleUseCase, coordinator: coordinator)
        let listViewController = ArticleListViewController(with: viewModel)
        return listViewController
    }
}
