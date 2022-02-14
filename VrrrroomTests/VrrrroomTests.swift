//
//  VrrrroomTests.swift
//  VrrrroomTests
//
//  Created by Paruyr Muradian on 2/11/22.
//

import XCTest
@testable import Vrrrroom

class VrrrroomTests: XCTestCase {
    
    func test_carLockActionViewModel_title() {
        let model = CarActionItemModel(titleString: "infinityu", state: .active, buttonItems: [])
        let viewModel = CarActionViewModel(model: model)
        XCTAssertEqual(viewModel.title, model.titleString)
    }
    
    func test_carLockActionViewModel_locked_state() {
        let model = CarActionItemModel(titleString: "", state: .active, buttonItems: [])
        let viewModel = CarLockActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "Locked")
    }
    
    func test_carLockActionViewModel_unlocked_state() {
        let model = CarActionItemModel(titleString: "", state: .inactive, buttonItems: [])
        let viewModel = CarLockActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "Unlocked")
    }
    
    func test_carLockActionViewModel_busy_state() {
        let model = CarActionItemModel(titleString: "", state: .busy, buttonItems: [])
        let viewModel = CarLockActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "...")
    }
    
    func test_carLockActionViewModel_unknown_state() {
        let model = CarActionItemModel(titleString: "", state: .unknown, buttonItems: [])
        let viewModel = CarLockActionViewModel(model: model)
        XCTAssertEqual(viewModel.stateString, "")
    }
    
    func test_carLockActionViewModel_state_change() {
        let model = CarActionItemModel(titleString: "", state: .unknown, buttonItems: [])
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
    
    // ButtonItemModel should go from inactive to loading on tap
    func test_ButtonItemModel_state_should_change_to_loading() {
        var item = CarActionButton(imageName: "", labelString: "", type: .stop, state: .inactive, isSelected: false)
        item.startLoading()
        XCTAssertEqual(item.state, ButtonState.loading)
    }
    
    func test_ButtonItemModel_state_should_change_to_active() {
        var item = CarActionButton(imageName: "", labelString: "", type: .stop, state: .loading, isSelected: false)
        item.becomeActive()
        XCTAssertEqual(item.state, ButtonState.active)
    }
    
    func test_ButtonItemModel_state_should_change_to_inactive() {
        var item = CarActionButton(imageName: "", labelString: "", type: .stop, state: .active, isSelected: false)
        item.becomeInactive()
        XCTAssertEqual(item.state, ButtonState.inactive)
    }
    
    func test_ButtonItemModel_state_should_change_to_disabled() {
        var item = CarActionButton(imageName: "", labelString: "", type: .stop, state: .inactive, isSelected: false)
        item.becomeDisabled()
        XCTAssertEqual(item.state, ButtonState.disabled)
    }
}
