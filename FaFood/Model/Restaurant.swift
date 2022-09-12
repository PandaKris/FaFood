//
//  Restaurant.swift
//  FaFood
//
//  Created by Kristanto Sean N on 09/09/22.
//

import Foundation

class Restaurant : Identifiable {
    let id = UUID()
    var name: String
    var image: String
    
    var weight = 1
    
    var weightedPercentage: String = ""
    var weightedValue: Float = 0
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    func setWeight(weight: Int) {
        self.weight = weight
    }
}

extension Array where Element : Restaurant {
    func getTotalWeight() -> Int {
        var total = 0
        self.forEach {
            total += $0.weight
        }
        return total
    }
    
    
}
