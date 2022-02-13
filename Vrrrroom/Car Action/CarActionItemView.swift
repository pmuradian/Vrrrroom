//
//  CarActionItemView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionItemView: View {
    @ObservedObject var viewModel: CarActionViewModel
    @State var selectedItem: ButtonItem?
    
    init(viewModel: CarActionViewModel) {
        self.viewModel = viewModel
    }
    
    private func createButtonFrom(buttonItem: ButtonItem) -> some View {
        return Button {
            selectedItem = buttonItem
        } label: {
            if let name = buttonItem.imageName {
                Image(name)
                    .resizable()
                    .scaledToFit()
            }
            if let text = buttonItem.labelString {
                Text(text)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .alert(item: $selectedItem) { item in
            Alert(title: Text("Are you sure"),
                  message: Text("Please confirm that you want to unlock Avto"),
                  primaryButton: .cancel(),
                  secondaryButton: .default(Text("Yes Unlock")) {
                    viewModel.actionFor(buttonItem: item)
            })
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.title)
                    .font(AppConstants.boldSystemFont)
                Divider()
                    .frame(width: 2.0, height: 20.0)
                    .background(.gray)
                Text(viewModel.stateString)
                    .font(AppConstants.graySystemFont)
                    .foregroundColor(.gray)
            }.padding(.bottom, -5)
            HStack {
                ForEach(viewModel.buttonItems, id: \.self) { item in
                    createButtonFrom(buttonItem: ButtonItem(imageName: item.imageName, labelString: item.labelString, type: item.type))
                        .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
                }.padding(10)
            }
            .frame(height: 90)
            .background(Color.white)
            .cornerRadius(5)
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(5)
    }
}

//struct CarActionItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarActionItemView()
//    }
//}
