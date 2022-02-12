//
//  CarActionItemView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionItemView: View {
    private struct Constants {
        static let boldSystemFont = Font.system(size: 18,
                                           weight: .bold,
                                           design: .default)
        static let graySystemFont = Font.system(size: 14,
                                           weight: .bold,
                                           design: .default)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Doors")
                    .font(Constants.boldSystemFont)
                Divider()
                    .frame(width: 2.0, height: 20.0)
                    .background(AppConstants.appMainBrown)
                Text("Locked")
                    .font(Constants.graySystemFont)
                    .foregroundColor(.gray)
            }
            HStack {
                Button {
                    
                } label: {
                    Image("act_lock")
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                .padding(5)

                Button {
                    
                } label: {
                    Image("act_unlock")
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                
                .padding(5)
            }
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

struct CarActionItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarActionItemView()
    }
}
