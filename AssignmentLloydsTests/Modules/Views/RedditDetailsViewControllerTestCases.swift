//
//  RedditListViewControllerTestCases.swift
//  AssignmentLloydsTests
//
//  Created by Manoj kumar Dixit on 18/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditDetailsViewControllerTestCases: XCTestCase {
    
    var model: RedditListEntity? = RedditListEntity(title: "title", imageUrl: "imageURL", authorName: "author_Name")
    func makeVC() -> RedditDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "redditDetailsViewController") as! RedditDetailsViewController
        controller.viewModel = RedditDetailsViewModel(redditDetails: model!)
        controller.loadViewIfNeeded()
        return controller
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        model = nil
        super.tearDown()
    }
    
    func testViewWillAppear() {
        let controller = makeVC()
        controller.viewWillAppear(true)
        XCTAssertEqual(controller.authorNameLbl.text, "title")
        XCTAssertNotNil(controller.authorImgView.image)
        
    }
}
