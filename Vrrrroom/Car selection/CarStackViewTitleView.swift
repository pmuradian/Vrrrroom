//
//  CarStackViewTitleView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarStackViewTitleView: View {
    @ObservedObject var viewModel: CarCollectionViewModel
    
    init(viewModel: CarCollectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            Text(viewModel.getSelectedCarName()).font(AppConstants.boldSystemFont)
            Divider().frame(width: 2.0, height: 20.0).background(AppConstants.appMainBrown)
            Image("notif_gas")
            Text(String(viewModel.getSelectedCarMilage())).font(AppConstants.boldSystemFont)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
        .background(Color.white)
    }
}

//struct CarStackViewTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarStackViewTitleView()
//    }
//}
