//
//  RedditServiceTest.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditServiceTest: XCTestCase {

    var redditListService: RedditListDataSource!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        redditListService = RedditListRemoteService(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        redditListService = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testBrewService_Success() {
        let expectation = expectation(description: "Reddit Service on Success Case")
        mockNetworkManager.redditList = MockData.redditList
        redditListService.fetchRedditList { (result: Result<RedditListResponse, Error>) in
            switch result {
            case let .success(list):
                if list.data?.children?.count ?? 0 > 0 {
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testBrewService_Failure() {
        let expectation = expectation(description: "Reddit Service on Failure Case")
        mockNetworkManager.error = NSError(domain: "FailedError", code: 0)
        redditListService.fetchRedditList { (result: Result<RedditListResponse, Error>) in
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


