//
//  ArticleDetailsUI.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import UIKit

final class ArticleDetailsUI {
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    lazy var posterImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h2))
        label.numberOfLines = 2
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        label.numberOfLines = 2
        return label
    }()
    
    lazy var abstractLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        label.numberOfLines = 0
        return label
    }()
    
    lazy var publishedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h4))
        return label
    }()
    
    func layout(in viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        addSubViews(in: viewController)
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension ArticleDetailsUI {
    
    func addSubViews(in viewController: UIViewController) {
        viewController.view.addSubview(verticalStack)
        [posterImageView, titleLabel, authorLabel, abstractLabel, publishedDateLabel].forEach(verticalStack.addArrangedSubview)
    }
    
    func setupConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(80)
        }
    }
}
