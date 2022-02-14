//
//  CarCollectionView.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/12/22.
//

import SwiftUI

struct CarCollectionView: View {
    @ObservedObject var viewModel: CarCollectionViewModel
    
    init(viewModel: CarCollectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Image("btn_refresh")
                Text("Updated 1 minute ago").fontWeight(.bold)
            }
            ScrollView(.horizontal) {
                  LazyHStack {
                      PageView(viewModel: self.viewModel)
                  }
            }
            HStack {
                ForEach(0..<3, id: \.self) { index in
                    Divider().frame(width: 30.0, height: 4.0).background {
                        index == viewModel.selectedCarIndex ? AppConstants.appMainBrown: Color.gray
                    }
                }
                Button() { } label: {
                    Text("+").font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 4)
                }
            }
        }
    }
}

struct PageView: View {
    @ObservedObject var viewModel: CarCollectionViewModel
    @State var pageIndex = 0
    
    init(viewModel: CarCollectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(viewModel.getCarIndices()) { i in
                VStack {
                    CarView(imageName: viewModel.getSelectedCarImageName()).tag(i)
                }
            }
            .padding(.all, 10)
        }
        .onChange(of: pageIndex, perform: { value in
            viewModel.setSelectedCarIndex(index: pageIndex)
        })
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

//struct CarCollectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarCollectionView()
//    }
//}
