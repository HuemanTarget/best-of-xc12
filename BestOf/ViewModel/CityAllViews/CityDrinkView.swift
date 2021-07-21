//
//  CityDrinkView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct CityDrinkView: View {
  let city: City
  
  @State private var drinkSelection: Int = 0
  
  var body: some View {
    VStack {
      VStack {
        Text("\(city.name) Drinks")
          .font(.title)
          .bold()
        
        Picker(selection: $drinkSelection, label: Text("Drinks")) {
//          ForEach(city.drink, id: \.self) {
//            Text($0).tag(drinkSelection)
//          }
          Text(city.drink[0]).tag(0)
          Text(city.drink[1]).tag(1)
          Text(city.drink[2]).tag(2)
          Text(city.drink[3]).tag(3)
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      
      
      if drinkSelection == 0 {
        DrinkOneView(city: city)
      } else if drinkSelection == 1 {
        DrinkTwoView(city: city)
      } else if drinkSelection == 2 {
        DrinkThreeView(city: city)
      } else {
        DrinkFourView(city: city)
      }
      
      Spacer()
    }
    
  }
}

//struct CityDrinkView_Previews: PreviewProvider {
//  static var previews: some View {
//    CityDrinkView(city: cities[0])
//  }
//}
