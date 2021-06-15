//
//  FoodThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodThreeView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.food[2]) in \(city.name)")
      .font(.title2)
  }
}

struct FoodThreeView_Previews: PreviewProvider {
  static var previews: some View {
    FoodThreeView(city: cities[0])
  }
}
