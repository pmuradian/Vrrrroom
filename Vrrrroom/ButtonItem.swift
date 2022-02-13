//
//  ButtonItem.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import Foundation

enum ButtonItemType {
    case lock
    case unlock
    case start
    case stop
}

struct ButtonItem: Hashable, Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    let imageName: String?
    let labelString: String?
    let type: ButtonItemType
}
