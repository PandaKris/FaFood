//
//  ContentViewModel.swift
//  FaFood
//
//  Created by Kristanto Sean N on 09/09/22.
//

import Foundation

class ContentViewModel : ObservableObject {
    
    @Published var restaurants = [
        Restaurant(name: "A&W", image: "AWLogo"),
        Restaurant(name: "Burger King", image: "BKLogo"),
        Restaurant(name: "Carl's Jr", image: "CJLogo"),
        Restaurant(name: "KFC", image: "KFCLogo"),
        Restaurant(name: "McDonalds", image: "MCDLogo"),
        Restaurant(name: "Sushi Tei", image: "SushiTeiLogo"),
        Restaurant(name: "Burger Bangor", image: "BKHamburger")
    ] {
        didSet {
            updateWeightValue()
        }
    }
    
    @Published var selectedRestaurant: Restaurant? = nil
    
    init() {
        updateWeightValue()
    }
    
    func updateWeightValue(){
        let total = restaurants.getTotalWeight()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        
        restaurants.forEach {
            // can simulate error here -> Float($0.weight/total)
            $0.weightedValue = Float($0.weight) / Float(total)
            $0.weightedPercentage = formatter.string(from: NSNumber(value: $0.weightedValue))!
        }
    }
    
    func clearResult() {
        selectedRestaurant = nil
    }
    
    func randomize() {
        clearResult()
        let rnd = Float.random(in: 0.0...1.0)
        var accWeight: Float = 0.0
        for restaurant in restaurants {
            accWeight += restaurant.weightedValue
            if rnd <= accWeight {
                selectedRestaurant = restaurant
                return
            }
        }

        if selectedRestaurant == nil {
            selectedRestaurant = restaurants.last
        }
        
    }
    
}
