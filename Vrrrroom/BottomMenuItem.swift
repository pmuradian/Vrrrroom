//
//  BottomMenuItem.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import SwiftUI

struct BottomMenuItem: View {
    
    private let menuIconName: String
    private let menuItemName: String
    
    init(menuIconName: String, menuItemName: String) {
        self.menuItemName = menuItemName
        self.menuIconName = menuIconName
    }
    
    var body: some View {
        VStack {
            Image(menuIconName)
                .renderingMode(.template)
                .resizable()
            Text(menuItemName)
                .font(AppConstants.smallSystemFont)
                .foregroundColor(AppConstants.appMainBrown)
        }
    }
}
