//
//  ArticleUseCaseTests.swift
//  iOSEvaluationTests
//
//  Created by Waqas Naseem on 10/01/2024.
//

import XCTest
@testable import iOSEvaluation

final class ArticleUseCaseTests: XCTestCase {
    
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
    }
    
    override func tearDown() {
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchCharacters_success() async throws {
        // Given
        let mockData = MockResponseBuilder.getMockArticlesData()
        mockNetworkService.result = .success(mockData)
        let useCase = DefaultArticleUseCase(networkService: mockNetworkService)
        
        // When
        let articles = try await useCase.fetchArticles()
        
        // Then
        // Verify characters are fetched from network service
        XCTAssertTrue(mockNetworkService.requestCalled)
        XCTAssertNotNil(articles)
    }
    
    func testFetchCharactersFailure() async throws {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockNetworkService.result = .failure(mockError)
        let useCase = DefaultArticleUseCase(networkService: mockNetworkService)
        
        // When
        do {
            _ = try await useCase.fetchArticles()
            // This line should not be executed if the call fails
            XCTFail("Fetching characters should fail but did not.")
        } catch {
            // Then
            guard let error = error as? ErrorMock else {
                return XCTFail("Fetching characters should fail but did not.")
            }
            XCTAssertEqual(error.localizedDescription, mockError.localizedDescription, "Received error should match the expected error.")
        }
    }
}
