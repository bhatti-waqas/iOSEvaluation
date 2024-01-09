//
//  ArticleListViewController.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import UIKit
import Combine

final class ArticleListViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var dataSource = makeDataSource()
    private let ui = ArticleListUI()
    private let viewModel: ArticleListViewModel
    private var bindingCancellable: AnyCancellable?
    
    init(with viewModel: ArticleListViewModel) {
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
        bindViewModel()
        viewModel.fetchArticlesTriggered()
    }
}

// MARK: - Private Methods
private extension ArticleListViewController {
    
    func configureUI() {
        title = viewModel.screenTitle
        ui.tableView.delegate = self
    }
    
    func bindViewModel() {
        bindingCancellable = viewModel.$viewState.sink { [weak self] viewState in
            self?.render(viewState)
        }
    }
    
    func render(_ state: ListViewState) {
        switch state {
        case .idle:
            beginLoading()
        case .loading:
            beginLoading()
        case .showArticles(let articles):
            show(articles)
        case let .showMessageWithTitle(message):
            endLoading()
            presentAlert(message)
        }
    }
    
    func beginLoading() {
        ui.spinner.startAnimating()
    }
    
    func endLoading() {
        ui.spinner.stopAnimating()
    }
}

// MARK: - TableView Diffable DataSource
extension ArticleListViewController {
    
    enum Section: CaseIterable {
        case articles
    }
    
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, ArticleRowViewModel> {
        UITableViewDiffableDataSource(
            tableView: ui.tableView,
            cellProvider: { tableView, indexPath, article in
                let cell: ArticleCell = tableView.dequeue(for: indexPath)
                cell.configure(with: article)
                return cell
            })
    }
    
    private func show(_ articles: [ArticleRowViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ArticleRowViewModel>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(articles, toSection: .articles)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UITableViewDelegate
extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetails(at: indexPath.row)
    }
}
