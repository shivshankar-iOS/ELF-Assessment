//
//  NetworkError.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//


import Foundation

// MARK: - Networking Errors
/// Common networking error cases surfaced by the network layer
enum NetworkError: Error {
    /// The URL could not be formed or is invalid
    case invalidURL
    /// The response was missing or malformed
    case invalidResponse
    /// The request failed at the transport layer (e.g., no internet)
    case transportError(underlying: Error)
    /// The server responded with a non-2xx status code
    case serverError(statusCode: Int, data: Data?)
    /// Decoding the response into the expected type failed
    case decodingFailed(underlying: Error)
    /// A generic or unknown error occurred
    case unknown
}
