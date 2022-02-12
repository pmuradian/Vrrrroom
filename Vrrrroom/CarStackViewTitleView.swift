//
//  CarStackViewTitleView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarStackViewTitleView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Car name")
            Divider().frame(width: 2.0, height: 20.0).background(Color(hex: "A66A53"))
            Image("notif_gas")
            Text("120mi")
        }
    }
}

struct CarStackViewTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CarStackViewTitleView()
    }
}
