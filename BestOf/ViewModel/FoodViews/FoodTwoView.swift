//
//  FoodTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodTwoView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.food[1]) in \(city.name)")
      .font(.title2)
  }
}

struct FoodTwoView_Previews: PreviewProvider {
  static var previews: some View {
    FoodTwoView(city: cities[0])
  }
}
