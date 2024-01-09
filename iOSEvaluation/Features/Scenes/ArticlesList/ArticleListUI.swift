//
//  ArticleListUI.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import UIKit
import SnapKit

final class ArticleListUI {
    
    lazy var spinner: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .large)
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
        tableView.backgroundView = spinner
        spinner.startAnimating()
        tableView.register(cell: ArticleCell.self)
        return tableView
    }()
    
    func layout(in viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        addSubViews(in: viewController)
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension ArticleListUI {
    
    func addSubViews(in viewController: UIViewController) {
        [tableView].forEach(viewController.view.addSubview)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(50)
        }
    }
}
