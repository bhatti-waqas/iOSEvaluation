//
//  ArticleDetailsViewControllerFactory.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

import UIKit

final class ArticleDetailsViewControllerFactory {
    
    static func makeArticleDetailsViewController(wit viewModel: ArticleRowViewModel) -> ArticleDetailsViewController {
        ArticleDetailsViewController(with: viewModel)
    }
}
