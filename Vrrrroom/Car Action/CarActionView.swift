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
                let doorActionModel = CarActionItemModel(titleString: "Doors",
                                                     state: .active,
                                                     buttonItems: [ButtonItem(imageName: "act_unlock",
                                                                        labelString: nil,
                                                                        type: .unlock),
                                                             ButtonItem(imageName: "act_lock",
                                                                        labelString: nil,
                                                                        type: .lock)])
                let doorsViewModel = CarLockActionViewModel(model: doorActionModel)
                CarActionItemView(viewModel: doorsViewModel)
                Spacer()
                let engineActionModel = CarActionItemModel(titleString: "Engine",
                                                           state: .inactive,
                                                           buttonItems: [ButtonItem(imageName: nil,
                                                                              labelString: "START",
                                                                              type: .start),
                                                                   ButtonItem(imageName: nil,
                                                                              labelString: "STOP",
                                                                              type: .stop)])
                let engineViewModel = CarEngineActionViewModel(model: engineActionModel)
                CarActionItemView(viewModel: engineViewModel)
            }
            Spacer()
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
