//
//  ArticleDetailsViewController.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import UIKit

final class ArticleDetailsViewController: UIViewController {
    private let ui: ArticleDetailsUI = ArticleDetailsUI()
    private let viewModel: ArticleRowViewModel
    
    init(with viewModel: ArticleRowViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui.layout(in: self)
        configureUI()
    }
}
// MARK: - Private Methods
private extension ArticleDetailsViewController {
    
    func configureUI() {
        title = viewModel.screenTitle
        ui.titleLabel.text = viewModel.title
        ui.authorLabel.text = viewModel.byline
        ui.publishedDateLabel.text = viewModel.publishedDate
        ui.imageView.setImage(with: viewModel.mediumThreeByTwo440Thumbnail)
    }
}
