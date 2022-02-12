//
//  CarActionItemView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionItemView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Doors")
                    .font(AppConstants.boldSystemFont)
                Divider()
                    .frame(width: 2.0, height: 20.0)
                    .background(.gray)
                Text("Locked")
                    .font(AppConstants.graySystemFont)
                    .foregroundColor(.gray)
            }.padding(.bottom, -5)
            HStack {
                Button { } label: {
                    Image("act_lock")
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
                }.padding(10)

                Button { } label: {
                    Image("act_unlock")
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
                }.padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(5)
        }
    }
}

struct CarActionItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarActionItemView()
    }
}
