////
////  BrewViewModelTest.swift
////  BrewInfoTests
////
////  Created by Shashank Shree on 21/12/22.
////
//
//import XCTest
//@testable import AssignmentLloyds
//
//final class BrewViewModelTest: XCTestCase {
//
//    var viewModel: IBrewInfoViewModel!
//    var mockBrewUseCase: MockBrewUseCase!
//    var delegate: MockBrewViewModelOutput!
//    
//    override func setUp() {
//        super.setUp()
//        mockBrewUseCase = MockBrewUseCase()
//        delegate = MockBrewViewModelOutput()
//        viewModel = BrewInfoViewModelImpl(useCase: mockBrewUseCase)
//        viewModel.outputDelegate = delegate
//    }
//    
//    override func tearDown() {
//        viewModel = nil
//        mockBrewUseCase = nil
//        delegate = nil
//        super.tearDown()
//    }
//    
//    func testSuccessScenario() {
//        mockBrewUseCase.brewList = MockData.brewList
//        viewModel.fetchBrewInfo()
//        let item = viewModel.getBrewItemforID(id: 0)
//        
//        XCTAssertTrue(viewModel.brewInfo.count == 25)
//        XCTAssert(delegate.methodsCalled.contains("handleSuccess()"))
//        XCTAssertNotNil(item)
//    }
//
//    func testErrorScenario() {
//        mockBrewUseCase.error = NSError(domain: "Failed_Error", code: 0)
//        viewModel.fetchBrewInfo()
//        
//        XCTAssertTrue(viewModel.brewInfo.count == 0)
//        XCTAssert(delegate.methodsCalled.contains("handleFailure(_:)"))
//    }
//}
//
//final class MockBrewViewModelOutput: BrewInfoViewModelOutput  {
//
//    var methodsCalled = [String]()
//
//    func handleSuccess() {
//        methodsCalled.append(#function)
//    }
//    
//    func handleFailure(_ message: String) {
//        methodsCalled.append(#function)
//    }
//}
