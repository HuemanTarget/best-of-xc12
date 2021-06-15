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
//          ForEach(city.food, id: \.self) {
//            Text($0).tag(foodSelection)
//          }
          Text(city.food[0]).tag(0)
          Text(city.food[1]).tag(1)
          Text(city.food[2]).tag(2)
          Text(city.food[3]).tag(3)
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      
      if foodSelection == 0 {
        FoodOneView(city: city)
      } else if foodSelection == 1 {
        FoodTwoView(city: city)
      } else if foodSelection == 2 {
        FoodThreeView(city: city)
      } else {
        FoodFourView(city: city)
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
