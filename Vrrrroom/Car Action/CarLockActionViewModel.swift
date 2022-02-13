//
//  CarLockActionViewModel.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import Foundation

class CarLockActionViewModel: CarActionViewModel {
    override init(model: CarActionItemModel) {
        super.init(model: model)
        switch model.state {
        case .active:
            stateString = "Locked"
        case .inactive:
            stateString = "Unlocked"
        case .busy:
            stateString = "..."
        case .unknown:
            stateString = ""
        }
    }
    
    override func changeState(newState: ItemState) {
        self.model.state = newState
        switch newState {
        case .active:
            stateString = "Locked"
        case .inactive:
            stateString = "Unlocked"
        case .busy:
            stateString = "..."
        case .unknown:
            stateString = ""
        }
    }
}
