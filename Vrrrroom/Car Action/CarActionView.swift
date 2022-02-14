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
                                                     state: .unknown,
                                                     buttonItems: [CarActionButton(imageName: "act_unlock",
                                                                        labelString: nil,
                                                                        type: .unlock,
                                                                        state: .inactive),
                                                             CarActionButton(imageName: "act_lock",
                                                                        labelString: nil,
                                                                        type: .lock,
                                                                        state: .inactive)])
                let doorsViewModel = CarLockActionViewModel(model: doorActionModel)
                CarActionItemView(viewModel: doorsViewModel)
                Spacer()
                let engineActionModel = CarActionItemModel(titleString: "Engine",
                                                           state: .unknown,
                                                           buttonItems: [CarActionButton(imageName: nil,
                                                                              labelString: "START",
                                                                              type: .start,
                                                                              state: .inactive),
                                                                   CarActionButton(imageName: nil,
                                                                              labelString: "STOP",
                                                                              type: .stop,
                                                                              state: .inactive)])
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
