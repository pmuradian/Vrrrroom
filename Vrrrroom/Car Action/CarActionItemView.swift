//
//  CarActionItemView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarActionItemView: View {
    @ObservedObject var viewModel: CarActionViewModel
    @State var selectedButtonInfo: ButtonInfo?
    @State private var isLoading = false
    @State private var animationAmount = 1.0

    init(viewModel: CarActionViewModel) {
        self.viewModel = viewModel
    }
    
    private func createButtonFrom(info: ButtonInfo) -> some View {
        return Button {
            // allow only inactive buttons to be touched
            if info.buttonState == .inactive {
                selectedButtonInfo = info
            }
        } label: {
        if let name = info.buttonImage {
                Image(name)
                    .resizable()
                    .scaledToFit()
            }
        if let text = info.buttonText {
                Text(text)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.white)
            }
        }
        .alert(item: $selectedButtonInfo) { item in
            Alert(title: Text("Are you sure"),
                  message: Text("Please confirm that you want to unlock Avto"),
                  primaryButton: .cancel(),
                  secondaryButton: .default(Text("Yes Unlock")) {
                    viewModel.actionFor(buttonInfo: item)
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
                ForEach(viewModel.buttonInfos, id: \.self) { item in
                    if item.buttonState == .loading {
                        Circle()
                            .trim(from: 0, to: 0.7)
                            .stroke(AppConstants.appMainBrown, lineWidth: 5)
                                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                                        .animation(Animation.default.repeatForever(autoreverses: false), value: animationAmount)
                                        .onAppear() {
                                            self.isLoading = true
                                            animationAmount += 1
                                        }
                                        .onDisappear(perform: {
                                            self.isLoading = false
                                            animationAmount -= 1
                                        })
                    } else {
                    createButtonFrom(info: item)
                        .padding(5)
                        .background(Color(hex: item.buttonColorHexString))
                        .clipShape(Circle())
                    }
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
