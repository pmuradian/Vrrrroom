//
//  CarActionView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionView: View {
    var body: some View {
        List {
            HStack {
                CarActionItemView()
                Spacer()
                CarActionItemView()
            }
        }
    }
}

struct CarActionView_Previews: PreviewProvider {
    static var previews: some View {
        CarActionView()
    }
}
