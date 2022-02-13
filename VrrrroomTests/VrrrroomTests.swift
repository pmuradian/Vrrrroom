//
//  VrrrroomTests.swift
//  VrrrroomTests
//
//  Created by Paruyr Muradian on 2/11/22.
//

import XCTest
@testable import Vrrrroom

class VrrrroomTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_carLockActionViewModel_title() {
        let model = CarActionItemModel(titleString: "infinityu", state: .active, icons: [])
        let viewModel = CarActionViewModel(model: model)
        XCTAssertEqual(viewModel.title, model.titleString)
    }
    
    func test_carLockActionViewModel_locked_state() {
        let model = CarActionItemModel(titleString: "", state: .active, icons: [])
        let viewModel = CarActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "Locked")
    }
    
    func test_carLockActionViewModel_unlocked_state() {
        let model = CarActionItemModel(titleString: "", state: .inactive, icons: [])
        let viewModel = CarActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "Unlocked")
    }
    
    func test_carLockActionViewModel_busy_state() {
        let model = CarActionItemModel(titleString: "", state: .busy, icons: [])
        let viewModel = CarActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "...")
    }
    
    func test_carLockActionViewModel_unknown_state() {
        let model = CarActionItemModel(titleString: "", state: .unknown, icons: [])
        let viewModel = CarActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "")
    }
    
    func test_carLockActionViewModelStateChange() {
        let model = CarActionItemModel(titleString: "", state: .unknown, icons: [])
        let viewModel = CarLockActionViewModel(model: model)
        viewModel.changeState(newState: .active)
        XCTAssertEqual(ItemState.active, viewModel.model.state)
        viewModel.changeState(newState: .inactive)
        XCTAssertEqual(ItemState.inactive, viewModel.model.state)
        viewModel.changeState(newState: .busy)
        XCTAssertEqual(ItemState.busy, viewModel.model.state)
        viewModel.changeState(newState: .unknown)
        XCTAssertEqual(ItemState.unknown, viewModel.model.state)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
