//
//  RedditListRepositoryTest.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditListRepositoryTest: XCTestCase {

    var redditListRepository: RedditListRepository!
    var mockRedditListService: MockRedditListService!
    
    override func setUp() {
        super.setUp()
        mockRedditListService = MockRedditListService()
        redditListRepository = RedditListRepositoryImpl(remote: mockRedditListService)
    }
    
    override func tearDown() {
        redditListRepository = nil
        mockRedditListService = nil
        super.tearDown()
    }
    
    func testBrewRepository_Success() {
        let expectation = expectation(description: "Reddit List Repository of Success Case")
        mockRedditListService.response = MockData.redditList
        redditListRepository.fetchRedditList { (result: Result<RedditListResponse, Error>) in
            switch result {
            case let .success(response):
                if response.data?.children?.count ?? 0 > 0 {
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testBrewRepository_Failure() {
        let expectation = expectation(description: "Reddit Repository of Failure Case")
        mockRedditListService.error = NetworkError.failed
        redditListRepository.fetchRedditList { (result: Result<RedditListResponse, Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case let .failure(error):
                XCTAssertEqual(error as! NetworkError, NetworkError.failed)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}

