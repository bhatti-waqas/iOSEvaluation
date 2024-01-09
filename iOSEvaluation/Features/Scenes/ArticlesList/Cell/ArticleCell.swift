//
//  ArticleCell.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import UIKit
import DesignSystem

final class ArticleCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = IOSColor.grey.color(opacity: 1)
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 20
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: ArticleRowViewModel) {
        nameLabel.text = article.title
        //profileImageView.setImage(with: character.imageUrl)
    }
}
// MARK: - Private Methods
private extension ArticleCell {
    
    func addSubViews() {
        contentView.addSubview(containerView)
        [profileImageView, nameLabel].forEach(containerView.addSubview)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(10)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(10)
            make.width.equalTo(profileImageView.snp.height)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
