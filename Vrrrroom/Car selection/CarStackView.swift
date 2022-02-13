//
//  CarStackView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarStackView: View {
    private let color = Color(.sRGB, red: 229.0 / 255.0, green: 229.0 / 255.0, blue: 229.0 / 255.0, opacity: 1.0)
    var body: some View {
//        NavigationView {÷
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
                CarStackViewTitleView()
                CarCollectionView()
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
