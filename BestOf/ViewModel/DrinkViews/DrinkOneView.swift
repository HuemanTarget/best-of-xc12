//
//  DrinkOneView.swift
//  BestOf
//
//  Created by Joshua Basche on 6/15/21.
//

import SwiftUI

struct DrinkOneView: View {
  let city: City
  
  var body: some View {
    Text("Best \(city.drink[0]) in \(city.name)")
      .font(.title2)
  }
}

struct DrinkOneView_Previews: PreviewProvider {
  static var previews: some View {
    DrinkOneView(city: cities[0])
  }
}
