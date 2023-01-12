//
//  RedditListUseCaseTest.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditListUseCaseTest: XCTestCase {
    
    var redditListUseCase: RedditListUseCase!
    var mockRedditListRepository: MockRedditListRepository!
    
    override func setUp() {
        super.setUp()
        mockRedditListRepository = MockRedditListRepository()
        redditListUseCase = RedditListUseCase(repository: mockRedditListRepository)
    }
    
    override func tearDown() {
        redditListUseCase = nil
        mockRedditListRepository = nil
        super.tearDown()
    }
    
    func testBrewUseCaseSuccess() {
        let expectation = expectation(description: "redditListUseCase Success Case")
        mockRedditListRepository.redditList = MockData.domainRedditList
        redditListUseCase.fetchList { (result: Result<[RedditListEntity], Error>) in
            switch result {
            case let .success(brew):
                XCTAssertTrue(brew.count == 25)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testBrewUseCaseFailure() {
        let expectation = expectation(description: "redditListUseCase Failure Case")
        mockRedditListRepository.error = NSError(domain: "Failed_Error", code: 0)
        redditListUseCase.fetchList { (result: Result<[RedditListEntity], Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
