//
//  NetworkService.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

import Foundation

// MARK: - Network Client
/// Concrete implementation of `NetworkClientProtocol` backed by `URLSession`
class NetworkClient: NetworkClientProtocol {
    
    // MARK: - Dependencies
    /// URLSession used to perform network requests
    private let session: URLSession
    
    // MARK: - Initialization
    /// Creates a network client
    /// - Parameter session: The URLSession instance to use. Defaults to `.shared`.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - API
    /// Performs a request against the given endpoint and decodes the response
    /// - Parameters:
    ///   - endpoint: The API endpoint to call
    ///   - completion: Completion handler with a result containing the decoded model on success or an error on failure
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = endpoint.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
