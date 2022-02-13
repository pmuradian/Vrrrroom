//
//  CarCollectionViewModel.swift
//  Vrrrroom
//
//  Created by Paruyr Muradian on 2/13/22.
//

import Foundation
import SwiftUI

// A model of car that is recieved from the outside world /like server responce/
struct CarDataModel {
    let name: String
    let milage: Double
    let imageName: String
}

class CarCollectionViewModel: ObservableObject {
    private let cars: [CarModel]
    @Published var selectedCarIndex: Int
    
    init(cars: [CarDataModel], selectedIndex: Int) {
        self.cars = cars.map {
            CarModel(name: $0.name, milage: $0.milage, imageName: $0.imageName)
        }
        self.selectedCarIndex = selectedIndex
    }
    
    func setSelectedCarIndex(index: Int) {
        selectedCarIndex = index
    }
    
    func getSelectedCarName() -> String {
        cars[selectedCarIndex].name
    }
    
    func getSelectedCarMilage() -> Double {
        cars[selectedCarIndex].milage
    }
    
    func getSelectedCarImageName() -> String {
        cars[selectedCarIndex].imageName
    }
    
    func getImageStringForCarAtIndex(index: Int) -> String {
        cars[index].imageName
    }
    
    func getCarIndices() -> Range<Int> {
        cars.indices
    }
}
