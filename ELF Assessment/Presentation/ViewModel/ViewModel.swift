//
//  Untitled.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

import Foundation

// MARK: - View Model
/// View model responsible for fetching repositories and exposing data/state to the view
class RepoListViewModel {
    
    // MARK: - Callbacks
    /// Invoked when new data is available and the UI should refresh
    var onDataUpdate: (() -> Void)?
    /// Invoked when an error occurs with a user-presentable message
    var onError: ((String) -> Void)?
    /// Invoked to indicate loading state changes
    var onLoading: ((Bool) -> Void)?
    
    // MARK: - Dependencies
    /// Service used to fetch repositories
    private let service: RepoServiceProtocol
    
    // MARK: - Data
    /// Current list of repositories fetched from the service
    var repos: [RepoModelElement] = []
    
    // MARK: - Initialization
    /// Creates a new view model
    /// - Parameter service: The repository service used to fetch data. Defaults to `RepoService()`.
    init(service: RepoServiceProtocol = RepoService()) {
        self.service = service
    }
    
    // MARK: - Public API
    /// Fetches repositories from the service and updates bindings on the main thread
    func fetchRepos() {
        onLoading?(true)
        service.fetchRepos { [weak self] result in
            DispatchQueue.main.async {
                self?.onLoading?(false)
                
                switch result {
                case .success(let repos):
                    self?.repos = repos
                    self?.onDataUpdate?()
                    
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
    
    /// Number of rows to display in the table view
    func numberOfRows() -> Int {
        return repos.count
    }
}
