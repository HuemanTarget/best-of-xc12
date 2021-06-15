//
//  DrinkFourView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkFourView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.drink[3]) in \(city.name)")
      .font(.title2)
  }
}

struct DrinkFourView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkFourView(city: cities[0])
  }
}
