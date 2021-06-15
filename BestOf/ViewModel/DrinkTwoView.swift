//
//  DrinkTwoView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkTwoView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.drink[1]) in \(city.name)")
      .font(.title2)
  }
}

struct DrinkTwoView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkTwoView(city: cities[0])
  }
}
