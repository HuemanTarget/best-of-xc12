//
//  FoodFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodFourView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.food[3]) in \(city.name)")
      .font(.title2)
  }
}

struct FoodFourView_Previews: PreviewProvider {
  static var previews: some View {
    FoodFourView(city: cities[0])
  }
}
