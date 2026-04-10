//
//  APIEndpoint.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

import Foundation

// MARK: - API Endpoints
/// Defines available API endpoints used by the app
enum APIEndpoint {
    /// Endpoint to fetch repositories for the organization
    case repos

    // MARK: - URL Construction
    /// The fully formed URL for the endpoint
    var url: URL? {
        switch self {
        case .repos:
            return URL(string: "https://api.github.com/orgs/square/repos")
        }
    }
}
