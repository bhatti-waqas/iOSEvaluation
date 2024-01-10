//
//  ArticleListViewModelTests.swift
//  iOSEvaluationTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
import Combine
import XCTest
@testable import iOSEvaluation

final class ArticleListViewModelTests: XCTestCase {
    
    private var sut: ArticleListViewModel!
    private var mockUseCase: MockArticleUseCase!
    private var mockNavigator: MockArticleNavigator!
    
    private var cancel: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancel = Set()
        mockUseCase = MockArticleUseCase()
        mockNavigator = MockArticleNavigator()
        sut = ArticleListViewModel(articleUseCase: mockUseCase, navigator: mockNavigator)
    }
    
    override func tearDown() {
        sut = nil
        mockUseCase = nil
        mockNavigator = nil
        cancel = nil
        super.tearDown()
    }
    
    func test_viewModel_configuration() {
        XCTAssertEqual(sut.screenTitle, StringKey.Generic.listScreenTitle.get())
    }
    
    func testFetchArticlesTriggered_whenServerReturnSuccess_shouldHaveValidStates() {
        // Given
        let mockArticleResponse = MockResponseBuilder.getMockArticlesResponse()
        mockUseCase.fetchArticleResult = .success(mockArticleResponse.results)
                
        // When
        sut.fetchArticlesTriggered()
        
        // Then
        XCTAssertEqual(sut.viewState, .loading)
        XCTExpect(toEventually: sut.viewState == .showArticles(sut.articleRowViewModels))
    }
    
    func testFetchArticlesTriggered_whenServerReturnFailure_shouldHaveValidStates() {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockUseCase.fetchArticleResult = .failure(mockError)
        var errorMessage = ""
        
        sut.$viewState
            .dropFirst()
            .sink { viewState in
                if case .showMessageWithTitle(let message) = viewState {
                    errorMessage = message
                }
            }.store(in: &cancel)
                
        // When
        sut.fetchArticlesTriggered()
        // Then
        XCTExpect(toEventually: errorMessage == mockError.localizedDescription)
    }
    
    func testFetchArticlesTriggered_EmptyResult() {
        // Given
        let mockArticlesEmptyResults = MockResponseBuilder.getMockArticleResponseWithEmptyResults()
        // Mock usecase with an response with empty results
        mockUseCase.fetchArticleResult = .success(mockArticlesEmptyResults.results)
        
        // When
        sut.fetchArticlesTriggered()
        
        // Assert that the view state transitions to .loading and then to .showMessageWithTitle with the correct message
        XCTAssertEqual(sut.viewState, .loading)
        XCTExpect(toEventually: sut.viewState == .showMessageWithTitle(message: StringKey.Error.emptyResultMessage.get()))
    }
    
    func testShowArticleDetails() {
        // Given
        let mockArticlesResponse = MockResponseBuilder.getMockArticlesResponse()
        sut.articleRowViewModels = mockArticlesResponse.results.map { ArticleRowViewModel(article: $0) }
        
        // When: Trigger the showArticleDetails method
        sut.showDetails(at: 0)
        
        XCTExpect(toEventually: mockNavigator.showDetailsInvoked)
    }
}
