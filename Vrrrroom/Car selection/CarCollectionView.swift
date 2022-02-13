//
//  CarCollectionView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarCollectionView: View {
    let images = ["bat1", "bat2", "bat3"]
    var body: some View {
        VStack {
            HStack {
                
                Image("btn_refresh")
                Text("Updated 1 minute ago").fontWeight(.bold)
            }
            ScrollView(.horizontal) {
                  LazyHStack {
                      PageView(withImages: images)
                  }
            }
            HStack {
                ForEach(1..<4, id: \.self) {_ in
                    Divider().frame(width: 30.0, height: 4.0).background(AppConstants.appMainBrown)
                }
                Button() { } label: {
                    Text("+").font(.largeTitle).bold()
                }
            }
        }
    }
}

struct PageView: View {
    private var imageNames: [String]
    @State var pageIndex = 0
    
    init(withImages: [String]) {
        self.imageNames = withImages
    }
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(values: imageNames.indices) { i in
                VStack {
                    Text("current page = \(pageIndex) ")
                    CarView(imageName: imageNames[i]).tag(i)
                }
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct CarCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarCollectionView()
    }
}

extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
    init(values: Data, content: @escaping (Data.Element) -> Content) {
        self.init(values, id: \.self, content: content)
    }
}
