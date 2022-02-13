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
    @Published var hasSelectedButtonItem = false
    @Published var isAnimating = false
    private var timer: Timer?
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
        
        hasSelectedButtonItem = true
        isAnimating = true
        for (index, item) in buttonItems.enumerated() {
            if item.type == buttonItem.type {
                buttonItems[index].startLoading()
            } else {
                buttonItems[index].becomeDisabled()
            }
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            self.isAnimating = false
            for (index, item) in self.buttonItems.enumerated() {
                if item.type == buttonItem.type {
                    self.buttonItems[index].becomeActive() // or become inactive in case of a falure
                } else {
                    self.buttonItems[index].becomeInactive()
                }
                switch self.buttonItems[index].type {
                case .lock, .start:
                    self.changeState(newState: .active)
                case .unlock, .stop:
                    self.changeState(newState: .inactive)
                }
            }
        }
        changeState(newState: .busy)
    }
    
    func changeState(newState: ItemState) {
        print("not impelmented")
    }
}
