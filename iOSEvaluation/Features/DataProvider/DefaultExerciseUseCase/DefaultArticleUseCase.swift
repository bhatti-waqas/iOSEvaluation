//
//  DefaultArticleUseCase.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Networking

final class DefaultArticleUseCase {
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
// MARK: - Currency Use-case implementation
extension DefaultArticleUseCase: ArticleUseCase {
    
    /// will fetch from cache first
    /// in order to provide offline support and caching
    func fetchArticles() async throws -> [Article] {
        try await networkService.request(with: .articles())
    }
}
