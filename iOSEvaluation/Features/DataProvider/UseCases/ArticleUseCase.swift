//
//  ArticleUseCase.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

protocol ArticleUseCase {
    func fetchArticles() async throws -> [Article]
}
