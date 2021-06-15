//
//  CityDrinkView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityDrinkView: View {
  let city: City
  
  @State private var drinkSelection = 0
  
  var body: some View {
    VStack {
      VStack {
        Text("\(city.name) Drinks")
          .font(.title)
          .bold()
        
        Picker(selection: $drinkSelection, label: Text("Drinks")) {
          ForEach(city.drink, id: \.self) {
            Text($0).tag(drinkSelection)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      Spacer()
    }
  }
}

struct CityDrinkView_Previews: PreviewProvider {
  static var previews: some View {
    CityDrinkView(city: cities[0])
  }
}
