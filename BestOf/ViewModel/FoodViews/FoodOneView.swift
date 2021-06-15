//
//  FoodOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct FoodOneView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.food[0]) in \(city.name)")
      .font(.title2)
  }
}

struct FoodOneView_Previews: PreviewProvider {
  static var previews: some View {
    FoodOneView(city: cities[0])
  }
}
