//
//  ButtonItem.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import Foundation

enum ButtonType {
    case lock
    case unlock
    case start
    case stop
}

enum ButtonState {
    case loading
    case active
    case inactive
    case disabled
}

struct CarActionButton: Hashable, Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    let imageName: String?
    let labelString: String?
    let type: ButtonType
    var state: ButtonState
    var isSelected: Bool = false
    
    mutating func startLoading() {
        switch state {
        case .inactive:
            state = .loading
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    mutating func becomeActive() {
        switch state {
        case .loading:
            state = .active
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    mutating func becomeInactive() {
        switch state {
        case .loading, .disabled, .active:
            state = .inactive
        default:
            print("Current state can not be changed to loading")
        }
    }
    
    mutating func becomeDisabled() {
        switch state {
        case .inactive, .active:
            state = .disabled
        default:
            print("Current state can not be changed to loading")
        }
    }
}
