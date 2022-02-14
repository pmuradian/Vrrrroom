//
//  ButtonInfo.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/14/22.
//

import Foundation

enum ButtonState {
    case active
    case inactive
    case disabled
    case loading
}

struct ButtonInfo: Hashable, Identifiable {
    var id: UUID {
        return UUID()
    }
    
    var buttonState = ButtonState.inactive
    var buttonImage: String?
    var buttonText: String?
    var buttonItem: ButtonItem
    
    var buttonColorHexString: String {
        switch buttonState {
        case .active:
            return AppConstants.appMainBrownColor
        case .inactive:
            return "000000" // black
        case .disabled:
            return "E5E4E2" // gray
        case .loading:
            return "FFFFFF" // white
        }
    }
    
    mutating func startLoading() {
        switch buttonState {
        case .inactive:
            buttonState = .loading
            buttonItem.startLoading()
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    mutating func becomeActive() {
        switch buttonState {
        case .loading:
            buttonState = .active
            buttonItem.becomeActive()
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    mutating func becomeInactive() {
        switch buttonState {
        case .loading, .disabled, .active:
            buttonState = .inactive
            buttonItem.becomeInactive()
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    mutating func becomeDisabled() {
        switch buttonState {
        case .inactive, .active:
            buttonState = .disabled
            buttonItem.becomeDisabled()
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    func hasSameType(buttonInfo: ButtonInfo) -> Bool {
        buttonInfo.buttonItem.type == buttonItem.type
    }
}
