//
//  ContentView.swift
//  FaFood
//
//  Created by Kristanto Sean N on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            Form {                
                if let selected = viewModel.selectedRestaurant {
                    Section("Result"){
                        HStack {
                            Text("You got : \(selected.name)")
                            Spacer()
                            Button(action: {
                                viewModel.clearResult()
                            }, label: {
                                Image(systemName: "x.circle.fill")
                            })
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        viewModel.randomize()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Randomize")
                            Spacer()
                        }
                    })
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                Section("List") {
                    ForEach(viewModel.restaurants.indices, id: \.self) { index in
                        RestaurantItemView(restaurant: $viewModel.restaurants[index])
                    }
                }
            }.navigationTitle("FaFood")
        }.onAppear {
            UIApplication.shared.addTapGestureRecognizer()
        }
    }
}

struct RestaurantItemView: View {
    @Binding var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.all, 8)
                .background(.white)
                .clipShape(Circle())
                .shadow(radius: 1)
            VStack {
                HStack {
                    Text(restaurant.name)
                        .font(.headline)
                    Spacer()
                    Text(restaurant.weightedPercentage)
                        .font(.headline)
                }
                HStack {
                    Text("Weight")
                    TextField("Weight", value: $restaurant.weight, format: .number)
                        .padding(.all, 8)
                        .background(Color("TextFieldColor"))
                        .shadow(color: Color.orange, radius: 1, x: 0, y: 0)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .keyboardType(.numberPad)
                }
            }.padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
