//
//  NetworkClientProtocol.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//


// MARK: - Networking Protocol
/// Abstraction over a network client capable of performing requests and decoding responses
protocol NetworkClientProtocol {
    /// Performs a request against the given endpoint and decodes the response
    /// - Parameters:
    ///   - endpoint: The API endpoint to call
    ///   - completion: Completion handler with a result containing the decoded model on success or an error on failure
    /// - Note: The generic type `T` must conform to `Decodable` and should match the expected response model
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
