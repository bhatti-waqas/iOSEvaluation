//
//  AppServiceLocator.swift
//  AppServiceLocator
//
//  Created by Waqas Naseem on 08/01/2024.
//

import Networking

let ServiceLocator = AppServiceLocator.shared

/// AppServiceLocator` is responsible to create/manage all dependencies of the application.
final class AppServiceLocator {
    
    // MARK: - Class Property
    static let shared = AppServiceLocator()
    
    // MARK: - private Property
    // Lazy Injection of dependencies
    private lazy var articleUseCase: ArticleUseCase = {
        let networkService: NetworkService = NetworkService()
        return DefaultArticleUseCase(networkService: networkService)
    }()
    
    func articleListViewControllersFactory() -> ArticleListViewControllerFactory {
        ArticleListViewControllerFactory(articleUseCase: articleUseCase)
    }
}
