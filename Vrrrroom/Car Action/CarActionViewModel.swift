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
    @Published var buttonInfos: [ButtonInfo]
    
    private var isAnimating = false
    private var timer: Timer?
    var model: CarActionItemModel
    
    init(model: CarActionItemModel) {
        self.model = model
        title = model.titleString
        stateString = model.state.rawValue
        buttonInfos = model.buttonItems.map { item in
            switch item.state {
            case .inactive: return ButtonInfo(buttonState: ButtonState.inactive,
                                              buttonImage: item.imageName,
                                              buttonText: item.labelString,
                                              buttonItem: item)
            case .active: return ButtonInfo(buttonState: ButtonState.active,
                                            buttonImage: item.imageName,
                                            buttonText: item.labelString,
                                            buttonItem: item)
            case .disabled: return ButtonInfo(buttonState: ButtonState.disabled,
                                              buttonImage: item.imageName,
                                              buttonText: item.labelString,
                                              buttonItem: item)
            case .loading: return ButtonInfo(buttonState: ButtonState.loading,
                                             buttonImage: item.imageName,
                                             buttonText: item.labelString,
                                             buttonItem: item)
            }
        }
    }
    
    func actionFor(buttonInfo: ButtonInfo) {
        print(buttonInfo)
        if model.state == .busy {
            return
        }

        isAnimating = true
        for (index, item) in buttonInfos.enumerated() {
            if item.hasSameType(buttonInfo: buttonInfo) {
                buttonInfos[index].startLoading()
            } else {
                buttonInfos[index].becomeDisabled()
            }
        }

        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            self.isAnimating = false
            for (index, item) in self.buttonInfos.enumerated() {
                if item.hasSameType(buttonInfo: buttonInfo) {
                    self.buttonInfos[index].becomeActive() // or become inactive in case of a falure
                } else {
                    self.buttonInfos[index].becomeInactive()
                }
            }
            switch buttonInfo.buttonItem.type {
            case .lock, .start:
                self.changeState(newState: .active)
            case .unlock, .stop:
                self.changeState(newState: .inactive)
            }
        }
        changeState(newState: .busy)
    }
    
    func changeState(newState: ItemState) {
        print("not impelmented")
    }
}
