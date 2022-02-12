//
//  CarInfoView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarView: View {
    private var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View {
        Image(imageName).resizable().scaledToFit().padding()
    }
}

//struct CarInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarView()
//    }
//}
