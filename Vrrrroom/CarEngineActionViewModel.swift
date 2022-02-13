//
//  CarEngineActionViewModel.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import Foundation

class CarEngineActionViewModel: CarActionViewModel {
    override init(model: CarActionItemModel) {
        super.init(model: model)
        switch model.state {
        case .active:
            stateString = "Started"
        case .inactive:
            stateString = "Stopped"
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
            stateString = "Started"
        case .inactive:
            stateString = "Stopped"
        case .busy:
            stateString = "..."
        case .unknown:
            stateString = ""
        }
    }
}
