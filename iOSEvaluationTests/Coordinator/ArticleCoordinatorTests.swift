//
//  ArticleCoordinatorTests.swift
//  iOSEvaluationTests
//
//  Created by Waqas Naseem on 11/01/2024.
//

import XCTest
@testable import iOSEvaluation

final class ArticleCoordinatorTests: XCTestCase {
    
    func testStart() {
        // Given
        let navigationController = AppNavigationController() // Instantiate a mock navigation controller
        let coordinator = ArticlesCoordinator(rootViewController: navigationController)
        
        // When
        coordinator.start()
        
        // Then
        // Add assertions to verify the expected behavior
        XCTAssertEqual(navigationController.viewControllers.count, 1, "One view controller should be pushed onto the stack")
        
        // Optionally, you can also assert specific properties or behaviors of the created view controller
        XCTAssertTrue(navigationController.viewControllers.first is ArticleListViewController, "The top view controller should be an instance of the article list view controller")
    }
}
