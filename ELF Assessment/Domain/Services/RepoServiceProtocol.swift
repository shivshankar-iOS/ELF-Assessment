//
//  RepoServiceProtocol.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//


// MARK: - Service Protocol
/// Abstraction for fetching repositories from a data source
protocol RepoServiceProtocol {
    /// Fetches the list of repositories
    /// - Parameter completion: Completion handler returning either an array of `RepoModelElement` on success or an `Error` on failure
    func fetchRepos(completion: @escaping (Result<[RepoModelElement], Error>) -> Void)
}
