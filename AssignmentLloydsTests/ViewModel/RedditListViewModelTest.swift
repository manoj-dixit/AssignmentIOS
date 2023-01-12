//
//  RedditListViewModelTest.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditListViewModelTest: XCTestCase {

    // Objects
    var viewModel: RedditListViewModel!
    var useCase: MockRedditListUseCase!
    
    override func setUp() {
        super.setUp()
        useCase = MockRedditListUseCase()
        viewModel = RedditListViewModel(useCase: useCase)
    }
    
    override func tearDown() {
        viewModel = nil
        useCase = nil
        super.tearDown()
    }
    
    func test_WhenRetriveTheList() {
        // when
        useCase.redditList = MockData.entityList
        viewModel.input.viewDidLoad()
        
        // then
        XCTAssertNotNil(viewModel.redditList?.count)
        XCTAssertEqual(viewModel.redditList?.count, 25)
    }
    
    func test_AfterSearchRetriveTheList() {
        // when
        useCase.redditList = MockData.entityList
        viewModel.input.viewDidLoad()
        // search the text
        viewModel.input.didSearch(inputString: "t2_jsk07")
        
        // then
        //waitForExpectations(timeout: 5)
        XCTAssertNotNil(viewModel.redditList?.count)
        XCTAssertEqual(viewModel.getRedditList()?.count, 1)
    }
    
    func test_AfterCancelSearchRetriveTheList() {
        // when
        useCase.redditList = MockData.entityList
        viewModel.input.viewDidLoad()
        // search the text
        viewModel.input.didCancelSearch()
        // then
        XCTAssertNotNil(viewModel.redditList?.count)
        XCTAssertEqual(viewModel.getRedditList()?.count, 25)
    }
    
    func test_IfErrorComes() {
        useCase.error = NSError(domain: "Failed_Error", code: 0)
        // when
        viewModel.input.viewDidLoad()
        // then
        XCTAssertNotNil(viewModel.showError.value)
        XCTAssertTrue(viewModel.redditList?.count == 0)
    }
}


