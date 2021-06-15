//
//  CityFoodView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityFoodView: View {
  let city: City
  
  @State private var foodSelection = 0
  
  var body: some View {
    VStack {
      VStack {
        Text("\(city.name) Food")
          .font(.title)
          .bold()
        
        Picker(selection: $foodSelection, label: Text("Food")) {
          ForEach(city.food, id: \.self) {
            Text($0).tag(foodSelection)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      Spacer()
    }
  }
}

struct CityFoodView_Previews: PreviewProvider {
  static var previews: some View {
    CityFoodView(city: cities[0])
  }
}
