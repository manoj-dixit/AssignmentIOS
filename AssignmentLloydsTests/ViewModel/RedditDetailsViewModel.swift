//
//  RedditListDetailsViewModelTest.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditListDetailsViewModelTest: XCTestCase {

    // Objects
    var viewModel: RedditDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = RedditDetailsViewModel(redditDetails: MockData.redditItem)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_WhenRetriveTheList() {
        // when
        let details = viewModel.output.getRedditData()
        // then
        XCTAssertNotNil(details.title)
        XCTAssertNotNil(details.authorName)
        XCTAssertNotNil(details.imagePath)
    }
}


