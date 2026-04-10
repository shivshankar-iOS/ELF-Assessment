//
//  RepoService.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

// MARK: - Service
/// Concrete implementation of `RepoServiceProtocol` that fetches repositories via a network client
class RepoService: RepoServiceProtocol {
    
    // MARK: - Dependencies
    /// Network client used to perform API requests
    private let client: NetworkClientProtocol
    
    // MARK: - Initialization
    /// Creates a new service
    /// - Parameter client: The network client used to issue requests. Defaults to `NetworkClient()`.
    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }
    
    // MARK: - API
    /// Fetches the list of repositories
    /// - Parameter completion: Completion handler returning either an array of `RepoModelElement` on success or an `Error` on failure
    func fetchRepos(completion: @escaping (Result<[RepoModelElement], Error>) -> Void) {
        client.request(endpoint: .repos, completion: completion)
    }
}
