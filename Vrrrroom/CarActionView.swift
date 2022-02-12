//
//  CarActionView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionView: View {
    var body: some View {
        VStack {
            HStack {
                CarActionItemView()
                Spacer()
                CarActionItemView()
            }
            Spacer()
            HStack {
                CarActionItemView()
                Spacer()
                CarActionItemView()
            }
            Spacer()
            HStack {
                CarActionItemView()
                Spacer()
                CarActionItemView()
            }
        }
        .shadow(color: .gray, radius: 1.0)
        .padding(10)
    }
}

struct CarActionView_Previews: PreviewProvider {
    static var previews: some View {
        CarActionView()
    }
}
