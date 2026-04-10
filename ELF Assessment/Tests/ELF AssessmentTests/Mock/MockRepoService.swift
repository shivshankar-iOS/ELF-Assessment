//
//  MockRepoService.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

import Foundation
@testable import ELF_Assessment

final class MockRepoService: RepoServiceProtocol {
    
    var shouldReturnError = false
    var mockRepos: [RepoModelElement] = []
    
    
    func fetchRepos(completion: @escaping (Result<[RepoModelElement], Error>) -> Void) {
        
        if shouldReturnError {
            completion(.failure(NSError(domain: "TestError", code: 1)))
        } else {
            completion(.success(mockRepos))
        }
    }
}
