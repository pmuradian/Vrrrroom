//
//  CarStackView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarStackView: View {
    @ObservedObject var viewModel: CarCollectionViewModel
    
    init() {
        self.viewModel = CarCollectionViewModel(cars: [CarDataModel(name: "Bat 1",
                                                                    milage: 123.0,
                                                                    imageName: "bat1"),
                                                       CarDataModel(name: "Bat 2",
                                                                     milage: 43.0,
                                                                     imageName: "bat2"),
                                                       CarDataModel(name: "Bat 3",
                                                                    milage: 13.5,
                                                                    imageName: "bat3")],
                                                selectedIndex: 0)
    }
    
    private let color = Color(.sRGB, red: 229.0 / 255.0, green: 229.0 / 255.0, blue: 229.0 / 255.0, opacity: 1.0)
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    LinearGradient(gradient: Gradient(colors: [color, Color.white]), startPoint: .top, endPoint: .bottom)
                }.frame(height: 200.0)
                VStack(spacing: 0.0) {
                    LinearGradient(gradient: Gradient(colors: [color, color]), startPoint: .top, endPoint: .bottom)
                }
            }
            VStack {
                CarStackViewTitleView(viewModel: viewModel)
                CarCollectionView(viewModel: viewModel)
                CarActionView()
                Spacer()
            }
        }
            
        
//        }
        
    }
}

struct CarStackView_Previews: PreviewProvider {
    static var previews: some View {
        CarStackView()
    }
}
