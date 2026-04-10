//
//  ELF_AssessmentTests.swift
//  ELF AssessmentTests
//
//  Created by Shivra on 10/04/26.
//


import Testing
@testable import ELF_Assessment

@MainActor
struct ELF_AssessmentTests {

    @Test
    func testFetchReposSuccess() async throws {
        
        // GIVEN
        let mockService = MockRepoService()
        mockService.mockRepos = [
               RepoModelElement(id: 1, name: "Repo1", description: "Test Repo")
           ]
        let viewModel = RepoListViewModel(service: mockService)
        
        var dataUpdated = false
        
        viewModel.onDataUpdate = {
            dataUpdated = true
        }
        
        // WHEN
        viewModel.fetchRepos()
        
        // Small delay to wait for async callback
        try await Task.sleep(nanoseconds: 100_000_000)
        
        // THEN
        #expect(dataUpdated == true)
        #expect(viewModel.numberOfRows() == 1)
        #expect(viewModel.repos.first?.name == "Repo1")
    }
    
    
    @Test
    func testFetchReposFailure() async throws {
        
        // GIVEN
        let mockService = MockRepoService()
        mockService.shouldReturnError = true
        
        let viewModel = RepoListViewModel(service: mockService)
        
        var errorMessage: String?
        
        viewModel.onError = { error in
            errorMessage = error
        }
        
        // WHEN
        viewModel.fetchRepos()
        
        try await Task.sleep(nanoseconds: 100_000_000)
        
        // THEN
        #expect(errorMessage != nil)
    }
}

