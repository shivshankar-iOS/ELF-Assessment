//
//  ViewController.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // View model responsible for fetching and exposing repository data
    private let viewModel = RepoListViewModel()
    // Large activity indicator to show loading state
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    // Pull-to-refresh control for the table view
    private let refreshControl = UIRefreshControl()

    // MARK: - Outlets
    @IBOutlet weak var repoTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchRepos()
    }
    
    // MARK: - Setup
    /// Configure table view, refresh control, and activity indicator
    private func setupUI() {
        repoTableView.accessibilityIdentifier = "repoTableView"
        repoTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "RepoTableViewCell")
        
        repoTableView.rowHeight = UITableView.automaticDimension
        repoTableView.estimatedRowHeight = 80
        repoTableView.dataSource = self
        repoTableView.delegate = self
        
        // Configure pull-to-refresh
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        refreshControl.tintColor = .systemGray
        repoTableView.refreshControl = refreshControl
        
        view.addSubview(activityIndicator)
        
        activityIndicator.center = view.center
    }
    
    // MARK: - Actions
    /// Triggered when user pulls to refresh the list
    @objc private func didPullToRefresh() {
        viewModel.fetchRepos()
    }
    
    // MARK: - Bindings
    /// Bind view model outputs to update UI and handle state changes
    private func bindViewModel() {
        viewModel.onDataUpdate = { [weak self] in
            self?.repoTableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
        
        viewModel.onError = { [weak self] message in
            self?.showError(message)
        }
        
        viewModel.onLoading = { [weak self] isLoading in
            if isLoading {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    // MARK: - Helpers
    /// Presents an alert with a retry option when an error occurs
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
            self.viewModel.fetchRepos()
        })
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
/// Conformance to UITableViewDataSource and UITableViewDelegate to populate and handle table interactions
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as? RepoTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.repos[indexPath.row])
        return cell
    }
}

