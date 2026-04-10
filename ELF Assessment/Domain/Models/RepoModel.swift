//
//  Untitled.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//


import Foundation
// NOTE:
// Instead of mapping the entire API response, I am using a minimal model
// that includes only the fields required for the current UI.
//
// The GitHub API response is extensive, and mapping all fields would lead to
// unnecessary complexity and increased maintenance overhead.
//
// This approach follows best practices:
// - Keeps the data layer lean
// - Improves readability and performance
// - Encourages separation of concerns (API model vs UI needs)
//
// The model is designed to be easily extendable if additional fields
// are required in future use cases.

struct RepoModelElement: Decodable {
    let id: Int?
    let name: String?
    let description: String?
}
