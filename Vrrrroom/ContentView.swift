//
//  ContentView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            CarStackView().tabItem {
                BottomMenuItem(menuIconName: "home", menuItemName: "Home")
            }
            CarStackView().tabItem {
                BottomMenuItem(menuIconName: "vehicle", menuItemName: "Vehicle")
            }
            CarStackView().tabItem {
                BottomMenuItem(menuIconName: "location", menuItemName: "Location")
            }
            CarStackView().tabItem {
                BottomMenuItem(menuIconName: "settings", menuItemName: "Settings")
            }
        }.accentColor(AppConstants.appMainBrown)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
