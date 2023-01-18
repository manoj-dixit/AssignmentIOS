//
//  RedditListViewControllerTestCase.swift
//  AssignmentLloydsTests
//
//  Created by Manoj kumar Dixit on 18/01/23.
//

import XCTest
@testable import AssignmentLloyds

final class RedditListViewControllerTestCase: XCTestCase {

    func makeVC() -> RedditListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "RedditListViewController") as! RedditListViewController
        controller.viewModel = RedditListViewModel(useCase: MockRedditListUseCase())
        controller.loadViewIfNeeded()
        return controller
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testViewWillAppear() {
        let controller = makeVC()
        controller.viewDidLoad()
        controller.viewModel?.loaderStatus.value = true
        controller.viewModel?.showError.value = "Network Error"
        XCTAssertEqual(controller.title, RedditModuleConstant.NavigationBarTitle.title)
        XCTAssertEqual(controller.searchBar.placeholder, RedditModuleConstant.searchBarTitle)
    }
}
