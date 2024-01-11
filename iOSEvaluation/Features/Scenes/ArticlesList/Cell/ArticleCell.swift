//
//  ArticleCell.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import UIKit
import DesignSystem

final class ArticleCell: UITableViewCell {
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h2))
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var publishedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h4))
        return label
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 50
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: ArticleRowViewModel) {
        titleLabel.text = article.title
        authorLabel.text = article.byline
        publishedDateLabel.text = article.publishedDate
        thumbnailImageView.setImage(with: article.standardThumbnail)
    }
}
// MARK: - Private Methods
private extension ArticleCell {
    
    func addSubViews() {
        [thumbnailImageView, verticalStack].forEach(contentView.addSubview)
        [titleLabel, authorLabel, publishedDateLabel].forEach(verticalStack.addArrangedSubview)
    }
    
    func setupConstraints() {
        thumbnailImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.width.equalTo(thumbnailImageView.snp.height)
            make.height.equalTo(100)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
}
