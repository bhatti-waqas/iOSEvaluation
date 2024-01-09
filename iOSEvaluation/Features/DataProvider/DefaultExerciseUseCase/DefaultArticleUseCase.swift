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
    
    func fetchArticles() async throws -> [Article] {
        do {
            let articleResponse: ArticleResponse = try await networkService.request(with: .articles())
            return articleResponse.results
        } catch {
            throw error
        }
    }
}
