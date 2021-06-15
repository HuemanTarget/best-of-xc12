//
//  DrinkThreeView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkThreeView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.drink[2]) in \(city.name)")
      .font(.title2)
  }
}

struct DrinkThreeView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkThreeView(city: cities[0])
  }
}
