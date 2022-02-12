//
//  TabView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import SwiftUI

struct BottomMenu: View {
    var body: some View {
        TabView {
            BottomMenuItem(menuIconName: "home", menuItemName: "Home")
//            Spacer()
            BottomMenuItem(menuIconName: "vehicle", menuItemName: "Vehicle")
//            Spacer()
            BottomMenuItem(menuIconName: "location", menuItemName: "Location")
//            Spacer()
            BottomMenuItem(menuIconName: "settings", menuItemName: "Settings")
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu()
    }
}
