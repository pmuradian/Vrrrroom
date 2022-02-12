//
//  CarActionItemView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionItemView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Doors")
                Divider().frame(width: 2.0, height: 20.0).background(Color(hex: "A66A53"))
                Text("Locked")
            }
            HStack {
                Button {
                    
                } label: {
                    Image("act_lock").background(Color.black)
                }
                Button {
                    
                } label: {
                    Image("act_unlock").background(Color.black)
                }
            }
        }
    }
}

struct CarActionItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarActionItemView()
    }
}
