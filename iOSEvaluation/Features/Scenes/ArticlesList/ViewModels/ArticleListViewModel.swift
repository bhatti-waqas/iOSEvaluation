//
//  ArticleListViewModel.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import Combine
import Coordinator

enum ListViewState: Equatable {
    case idle
    case loading
    case showArticles([ArticleRowViewModel])
    case showMessageWithTitle(message: String)
}

final class ArticleListViewModel {
    
    private var fetchingTask: Task<Void, Never>?
    let articleUseCase: ArticleUseCase
    let coordinator: DetailCoordinator
    var articleRowViewModels: [ArticleRowViewModel] = []
    @Published private(set) var viewState: ListViewState = .idle
    
    let screenTitle = StringKey.Generic.listScreenTitle.get()
    
    init(articleUseCase: ArticleUseCase, coordinator: DetailCoordinator) {
        self.articleUseCase = articleUseCase
        self.coordinator = coordinator
    }
    
    deinit {
        fetchingTask?.cancel()
    }
    
    func fetchArticlesTriggered() {
        fetchArticles()
    }
    
    func showDetails(at index: Int) {
        let row = articleRowViewModels[index]
        coordinator.navigateToDetails(with: row)
    }
}

// MARK: - Private methods
private extension ArticleListViewModel {
    
    func fetchArticles() {
        viewState = .loading
        fetchingTask = Task { @MainActor in
            do {
                let articles = try await articleUseCase.fetchArticles()
                if articles.isEmpty {
                    viewState = .showMessageWithTitle(message: StringKey.Error.emptyResultMessage.get())
                } else {
                    articleRowViewModels = prepareArticles(articles: articles)
                    viewState = .showArticles(articleRowViewModels)
                }
            } catch {
                viewState = .showMessageWithTitle(message: error.localizedDescription)
            }
        }
    }
    
    func prepareArticles(articles: [Article]) -> [ArticleRowViewModel] {
        articles.map(makeArticleRowViewModel(with:))
    }
    
    func makeArticleRowViewModel(with article: Article) -> ArticleRowViewModel {
        .init(article: article)
    }
    
    func getArticle(at index: Int) -> ArticleRowViewModel {
        articleRowViewModels[index]
    }
}
