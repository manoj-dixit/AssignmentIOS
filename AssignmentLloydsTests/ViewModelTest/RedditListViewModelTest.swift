//
//  RedditListViewModelTest.swift
//  DemoHclTests
//
//  Created by Vishal on 15/08/21.
//

import XCTest
@testable import AssignmentLloyds

class RedditListViewModelTest: XCTestCase {

    // Objects
    var viewModel: RedditListViewModel!
    class RedditListUseCaseMock: UseCase {
        var expectation: XCTestExpectation?
        var errorValue: ErrorResponse?
        var list: [RedditListEntity] = []
        func fetchList(request: API?, success: @escaping ([RedditListEntity]?) -> Void, error: @escaping (ErrorResponse) -> Void) {
            if let errorMsg = errorValue {
                error(errorMsg)
            } else {
                success(list)
            }
            expectation?.fulfill()
        }
    }
    
    func test_WhenRetriveTheList() {
        // given
        let searchMoviesUseCaseMock = RedditListUseCaseMock()
        searchMoviesUseCaseMock.expectation = self.expectation(description: "contains list")
        searchMoviesUseCaseMock.list = [RedditListEntity(title: "t1_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t1"), RedditListEntity(title: "t2_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t2"), RedditListEntity(title: "t3_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t3"), RedditListEntity(title: "t4_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t4")]
        
        let viewModel = RedditListViewModel(useCase: searchMoviesUseCaseMock)
        // when
        viewModel.input.viewDidLoad()
        
        // then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(viewModel.redditList?.count)
        XCTAssertEqual(viewModel.redditList?.count, 4)
    }
    
    func test_AfterSearchRetriveTheList() {
        // given
        let searchMoviesUseCaseMock = RedditListUseCaseMock()
        searchMoviesUseCaseMock.expectation = self.expectation(description: "contains only first element")
        searchMoviesUseCaseMock.list = [RedditListEntity(title: "t1_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t1"), RedditListEntity(title: "t2_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t2"), RedditListEntity(title: "t3_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t3"), RedditListEntity(title: "t4_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "search")]
        
        let viewModel = RedditListViewModel(useCase: searchMoviesUseCaseMock)
        // when
        viewModel.input.viewDidLoad()
        // search the text
        viewModel.input.didSearch(inputString: "search")
        
        // then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(viewModel.redditList?.count)
        XCTAssertEqual(viewModel.getRedditList()?.count, 1)
    }
    
    func test_AfterCancelSearchRetriveTheList() {
        // given
        let searchMoviesUseCaseMock = RedditListUseCaseMock()
        searchMoviesUseCaseMock.expectation = self.expectation(description: "contains the full list")
        searchMoviesUseCaseMock.list = [RedditListEntity(title: "t1_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t1"), RedditListEntity(title: "t2_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t2"), RedditListEntity(title: "t3_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "t3"), RedditListEntity(title: "t4_12", imageUrl: "abc.com", totalAwardsReceived: 3, authorName: "search")]
        
        let viewModel = RedditListViewModel(useCase: searchMoviesUseCaseMock)
        // when
        viewModel.input.viewDidLoad()
        // search the text
        viewModel.input.didCancelSearch()
        // then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(viewModel.redditList?.count)
        XCTAssertEqual(viewModel.getRedditList()?.count, 4)
    }
    
    func test_IfErrorComes() {
        let searchMoviesUseCaseMock = RedditListUseCaseMock()
        searchMoviesUseCaseMock.expectation = self.expectation(description: "Error Case")
        searchMoviesUseCaseMock.errorValue = ErrorResponse(message: "error")
        
        let viewModel = RedditListViewModel(useCase: searchMoviesUseCaseMock)
        // when
        viewModel.input.viewDidLoad()
        // then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(viewModel.showError.value)
    }
}


