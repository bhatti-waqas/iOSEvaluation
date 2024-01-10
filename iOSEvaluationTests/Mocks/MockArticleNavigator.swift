//
//  MockArticleNavigator.swift
//  iOSEvalutationTests
//
//  Created by Waqas Naseem on 10/01/2024.
//

import Foundation
@testable import iOSEvaluation

final class MockArticleNavigator: ArticlesNavigator {
    var showDetailsInvoked: Bool = false
    
    func showDetails(with viewModel: ArticleRowViewModel) {
        showDetailsInvoked = true
    }
}
