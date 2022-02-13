//
//  CarActionViewModel.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import Foundation

class CarActionViewModel: ObservableObject {
    @Published var title: String
    @Published var stateString: String
    @Published var buttonItems: [ButtonItem]
    var model: CarActionItemModel
    
    init(model: CarActionItemModel) {
        self.model = model
        title = model.titleString
        stateString = model.state.rawValue
        buttonItems = model.buttonItems
    }
    
    func actionFor(buttonItem: ButtonItem) {
        if model.state == .busy {
            return
        }
        
        switch buttonItem.type {
        case .lock, .start:
            if model.state != .active {
                changeState(newState: .active)
            }
        case .unlock, .stop:
            if model.state != .inactive {
                changeState(newState: .inactive)
            }
        }
    }
    
    func changeState(newState: ItemState) {
        print("not impelmented")
    }
}
