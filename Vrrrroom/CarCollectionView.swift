//
//  CarCollectionView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarCollectionView: View {
    var body: some View {
        VStack {
            HStack {
                
                Image("btn_refresh")
                Text("last updated")
            }
            ScrollView(.horizontal) {
                  LazyHStack {
                      PageView()
                  }
            }
            HStack {
                ForEach(1..<4, id: \.self) {_ in
                    Divider().frame(width: 30.0, height: 4.0).background(Color(hex: "A66A53"))
                }
                Button("+") {
                    
                }
            }
        }
    }
    
    
}
struct PageView: View {
    var body: some View {
        TabView {
            ForEach(0..<4) { i in
                ZStack {
                    CarView()
                }
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CarCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarCollectionView()
    }
}
